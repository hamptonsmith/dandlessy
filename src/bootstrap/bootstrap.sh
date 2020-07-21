#!/bin/bash

# Collect info, partition, install grub, create a minimal update boot
# partition, then reboot onto that partition to continue install.

function randomSlug() {
    cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w $1 | head -n 1
}

function doInstall() {
    set -e
    set -x
    
    # For debugging purpose, useful to do a little cleanup if this script got
    # half-run.
    
    umount /mnt &> /dev/null || true
    umount /mnt/fossil &> /dev/null || true
    umount /mnt/guest/mnt/fossil &> /dev/null || true
    umount /mnt/guest &> /dev/null || true
    
    if ! ping google.com -c1 &> /dev/null; then
        echo "Couldn't reach google.com.  Civilization has fallen or the" \
                "network isn't working."
        exit 1
    fi
    
    timedatectl set-ntp true
    
    DRIVE_LIST=$( \
            lsblk -dplnx size -o name,size | grep -Ev "boot|rpmb|loop" | tac)
    DRIVE=$( \
            dialog --stdout --menu "Select installation disk" 0 0 0 \
                    ${DRIVE_LIST}) || \
            exit 1
    
    HOSTNAME=$(dialog --stdout --inputbox "Enter hostname" 0 0) || exit 1
    ROOT_PASSWORD=$( \
                dialog --stdout --inputbox "Enter root password" 0 0) \
                || exit 1
    MEDIA_BOX_USER=$(
            dialog --stdout --inputbox "Enter media box user name" 0 0) \
            || exit 1
    MEDIA_BOX_PASSWORD=$(dialog --stdout --inputbox \
            "Enter media box user password" 0 0) \
            || exit 1    
    
    parted --script "${DRIVE}" -- mklabel gpt \
            mkpart "\"GRUB boot partition\"" fat32 1Mib 2Mib \
            set 1 bios_grub on \
            mkpart "\"swap partition\"" linux-swap 2MiB 3816MiB \
            mkpart "\"fossil partition\"" ext4 3816MiB 7631MiB \
            mkpart "\"update partition\"" ext4 7631MiB 13353MiB \
            mkpart "\"main partition\"" ext4 13353MiB 100%
    
    mkswap "${DRIVE}2"
    
    FOSSIL_PARTITION="${DRIVE}3"
    UPDATE_PARTITION="${DRIVE}4"
    MAIN_PARTITION="${DRIVE}5"
    
    if [[ "$(blkid -s TYPE -o value $FOSSIL_PARTITION)" != "ext4" ]]; then
        mkfs.ext4 -F "$FOSSIL_PARTITION"
    else
        # If we happen to have a pacman-cache, let's keep it to save some time,
        # but delete everything else.
        
        mkdir -p /mnt/fossil
        mount "$FOSSIL_PARTITION" /mnt/fossil
        
        for NODE in /mnt/fossil/*; do
            if [[ "$NODE" != "/mnt/fossil/pacman-cache" ]]; then
                rm -rf "$NODE"
            fi
        done
        
        umount /mnt/fossil
    fi
    
    mkfs.ext4 -F "$UPDATE_PARTITION"

    mkdir -p /mnt/fossil
    mount "$FOSSIL_PARTITION" /mnt/fossil
    mkdir -p /mnt/fossil/pacman-cache
    
    cp default-dandlessy-config /mnt/fossil/dandlessy-config
    cp known_hosts /mnt/fossil/known_hosts
    
    sed -i "s/{{hostname}}/$HOSTNAME/g" /mnt/fossil/dandlessy-config
        
    sed -i "s|{{main-partition}}|$MAIN_PARTITION|g" \
            /mnt/fossil/dandlessy-config

    sed -i "s/{{media-box-user}}/$MEDIA_BOX_USER/g" \
            /mnt/fossil/dandlessy-config
    
    mkdir -p /mnt/guest
    mount "$UPDATE_PARTITION" /mnt/guest
    
    pacstrap -c /mnt/guest --cachedir "/mnt/fossil/pacman-cache" \
            arch-install-scripts base git grub linux linux-firmware \
            networkmanager openssh os-prober wget
    
    UPD_HOSTNAME=$(randomSlug 10)
    echo "$UPD_HOSTNAME" > /mnt/guest/etc/hostname
    
    genfstab -U /mnt/guest >> /mnt/guest/etc/fstab
    
    FOSSIL_PARTITION_UUID=$(blkid -s UUID -o value "$FOSSIL_PARTITION")
    echo "UUID=$FOSSIL_PARTITION_UUID /mnt/fossil ext4 defaults 0 2" \
            >> /mnt/guest/etc/fstab
    mkdir -p /mnt/guest/mnt/fossil
    
    UPD_HOSTS='/mnt/guest/etc/hosts'
    echo '127.0.0.1 localhost'                                > "$UPD_HOSTS"
    echo '::1'                                               >> "$UPD_HOSTS"
    echo "127.0.1.1 $UPD_HOSTNAME.localdomain $UPD_HOSTNAME" >> "$UPD_HOSTS"
    
    GETTY_PATH='/mnt/guest/etc/systemd/system/getty@tty1.service.d'
    mkdir -p "$GETTY_PATH"
    
    GETTY_CONF="$GETTY_PATH/autologin.conf"
    echo '[Service]' > "$GETTY_CONF"
    echo 'ExecStart=' >> "$GETTY_CONF"
    echo 'ExecStart=-/usr/bin/agetty' \
            '--autologin root --noclear %I 38400 linux' >> "$GETTY_CONF"
    
    cp dandlessy-update /mnt/guest/usr/bin/dandlessy-update
    chmod a+x /mnt/guest/usr/bin/dandlessy-update
    
    echo 'dandlessy-update' >> /mnt/guest/root/.profile
    
    ln -sf /mnt/guest/usr/share/zoneinfo/US/Eastern /mnt/guest/etc/localtime
    sed -i "s/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g" /mnt/guest/etc/locale.gen
    
    echo 'LANG=en_US.UTF-8' > /mnt/guest/etc/locale.conf
    
    sed -i 's|#CacheDir *=.*|CacheDir=/mnt/fossil/pacman-cache/|g' \
            /mnt/guest/etc/pacman.conf
    
    # We need a slightly different GRUB install based on BIOS vs. UEFI.
    if ls /sys/firmware/efi/efivars &> /dev/null; then
        # UEFI
        echo 'UEFI not currently supported.'
        exit 1
    else
        # BIOS
        GRUB_INSTALL="grub-install --target=i386-pc $DRIVE"
    fi
    
    # We create users and set passwords specifically to generate a sensible
    # /etc/shadow file with which to seed the live system so we don't have to
    # store plaintext passwords anywhere.
    COMMANDS=$(echo \
            'systemctl enable NetworkManager.service &&' \
            'hwclock --systohc &&' \
            'timedatectl set-ntp true &&' \
            'locale-gen &&' \
            "echo 'root:$ROOT_PASSWORD' | chpasswd &&" \
            "useradd $MEDIA_BOX_USER &&" \
            "echo $MEDIA_BOX_USER:$MEDIA_BOX_PASSWORD | chpasswd &&" \
            "$GRUB_INSTALL &&" \
            'mkdir -p /boot/grub &&' \
            'grub-mkconfig -o /boot/grub/grub.cfg')
    
    arch-chroot /mnt/guest /bin/bash -c "$COMMANDS"
    
    rm /run/initramfs/shutdown
    cp custom-shutdown /run/initramfs/shutdown
    chmod a+x /run/initramfs/shutdown
    
    reboot now
}

doInstall
