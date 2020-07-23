#!/bin/bash

# Install `GRUB` + `arch` with access to the internet.

function doInstall() {
    set -e
    set -x
    
    # For debugging purpose, useful to do a little cleanup if this script got
    # half-run.
    
    if ! ping google.com -c1 &> /dev/null; then
        echo "Couldn't reach google.com.  Civilization has fallen or the" \
                "network isn't working."
        exit 1
    fi
    
    umount /mnt &> /dev/null || true
    umount /mnt/fossil &> /dev/null || true
    umount /mnt/guest/mnt/fossil &> /dev/null || true
    umount /mnt/guest &> /dev/null || true
    
    mount /mnt/fossil
    
    timedatectl set-ntp true
    
    FOSSIL_PARTITION=$(findmnt -n /mnt/fossil -o SOURCE)
    
    if [[ "$?" != "0" || ! -f "/mnt/fossil/dandlessy-config" ]]; then
        echo "This doesn't appear to be a Dandlessy box.  You should install "
        echo "from the bootstrapper instead."
        exit 1
    fi
    
    source /mnt/fossil/dandlessy-config
    
    mkfs.ext4 -F "$MAIN_PARTITION"
    mkdir -p /mnt/guest
    mount "$MAIN_PARTITION" /mnt/guest
    MAIN_PARTITION_UUID=$(blkid -s UUID -o value "$MAIN_PARTITION")
    
    mkdir -p /mnt/fossil/pacman-cache
    pacstrap -c /mnt/guest --cachedir "/mnt/fossil/pacman-cache" \
            base grub intel-ucode linux linux-firmware networkmanager
    
    genfstab -U /mnt/guest >> /mnt/guest/etc/fstab
    echo "$HOSTNAME" > /mnt/guest/etc/hostname
    
    FOSSIL_PARTITION_UUID=$(blkid -s UUID -o value "$FOSSIL_PARTITION")
    echo "UUID=$FOSSIL_PARTITION_UUID /mnt/fossil ext4 defaults 0 2" \
            >> /mnt/guest/etc/fstab
    mkdir -p /mnt/guest/mnt/fossil

    UPDATE_PARTITION=$(df -P / | tail -1 | cut -d' ' -f1)
    UPDATE_PARTITION_UUID=$(blkid -s UUID -o value "$UPDATE_PARTITION")
    echo "UUID=$UPDATE_PARTITION_UUID /mnt/update ext4 defaults 0 2" \
            >> /mnt/guest/etc/fstab
    mkdir -p /mnt/guest/mnt/update
    
    if [[ ! -d /etc/original-grub.d ]]; then
        mkdir /etc/original-grub.d
        cp /etc/grub.d/* /etc/original-grub.d
    fi
    
    rm /etc/grub.d/*
    cp /etc/original-grub.d/00_header /etc/grub.d/00_header
    cp /etc/original-grub.d/40_custom /etc/grub.d/40_custom
    
    if [[ -f /boot/intel-ucode.img ]]; then
        MICROCODE_IMG='/boot/intel-ucode.img'
    fi
    
    cat menuentry.template | \
            sed 's/{{label}}/Dandlessy/g' | \
            sed 's/{{id}}/dandlessy-main/g' | \
            sed "s/{{root-uuid}}/$MAIN_PARTITION_UUID/g" | \
            sed "s/{{boot-uuid}}/$UPDATE_PARTITION_UUID/g" | \
            sed "s/{{microcode-img}}/$MICROCODE_IMG/g" \
            >> /etc/grub.d/40_custom
    
    cat menuentry.template | \
            sed 's/{{label}}/Update Dandlessy/g' | \
            sed 's/{{id}}/dandlessy-update/g' | \
            sed "s/{{root-uuid}}/$UPDATE_PARTITION_UUID/g" | \
            sed "s/{{boot-uuid}}/$UPDATE_PARTITION_UUID/g" | \
            sed "s/{{microcode-img}}/$MICROCODE_IMG/g" \
            >> /etc/grub.d/40_custom
    
    sed -i 's/GRUB_DEFAULT=.*/GRUB_DEFAULT=saved/g' /etc/default/grub
    sed -i 's/GRUB_TIMEOUT=.*/GRUB_TIMEOUT=2/g' /etc/default/grub
    sed -i 's/GRUB_TIMEOUT_STYLE=.*/GRUB_TIMEOUT_STYLE=countdown/g' \
            /etc/default/grub
    
    grub-set-default dandlessy-main
    
    grub-mkconfig -o /boot/grub/grub.cfg
    
    # About to switch contexts into our chroot.  Let's make sure things are
    # available inside.
    
    # Our installer files.
    mkdir -p /mnt/guest/root/mediabox-setup
    cp -a . /mnt/guest/root/mediabox-setup
    
    ln -sf /mnt/guest/usr/share/zoneinfo/US/Eastern /mnt/guest/etc/localtime
    sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /mnt/guest/etc/locale.gen
    echo 'LANG=en_US.UTF-8' > /mnt/guest/etc/locale.conf
    
    echo '127.0.0.1 localhost'                        > /mnt/guest/etc/hosts
    echo '::1'                                       >> /mnt/guest/etc/hosts
    echo "127.0.1.1 $HOSTNAME.localdomain $HOSTNAME" >> /mnt/guest/etc/hosts
    
    sed -i 's|#CacheDir *=.*|CacheDir=/mnt/fossil/pacman-cache/|g' \
            /mnt/guest/etc/pacman.conf
    
    COMMANDS=$(echo \
            'systemctl enable NetworkManager.service &&' \
            'hwclock --systohc &&' \
            'timedatectl set-ntp true &&' \
            'locale-gen &&' \
            'groupadd -r autologin &&' \
            "useradd -m -G autologin -s /bin/bash $MEDIA_BOX_USER")
    
    arch-chroot /mnt/guest /bin/bash -c "$COMMANDS"
    
    # Our /etc/shadow file has been seeded with root and $MEDIA_BOX_USER
    # passwords.  Let's transfer that into the main install.
    cp /etc/shadow /mnt/guest/etc/shadow
    chmod 600 /mnt/guest/etc/shadow
    
    arch-chroot /mnt/guest /bin/bash /root/mediabox-setup/install-mediabox.sh

    grub-set-default 0
    
    reboot now
}

doInstall
