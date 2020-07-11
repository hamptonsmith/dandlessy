#!/bin/bash

# Install `GRUB` + `arch` with access to the internet.

function doInstall() {
    set -e
    set -x
    
    # For debugging purpose, useful to do a little cleanup if this script got
    # half-run.
    
    umount /mnt &> /dev/null || true
    umount /mnt/fossil &> /dev/null || true
    umount /mnt/guest/mnt/fossil &> /dev/null || true
    umount /mnt/guest &> /dev/null || true
    
    if ls /sys/firmware/efi/efivars &> /dev/null; then
        BOOT_MODE="UEFI"
    else
        BOOT_MODE="BIOS"
    fi
    
    if ! ping google.com -c1 &> /dev/null; then
        echo "Couldn't reach google.com.  Civilization has fallen or the" \
                "network isn't working."
        exit 1
    fi
    
    timedatectl set-ntp true
    
    EXT4_PARTITIONS=$(blkid -t TYPE="ext4" | cut -d: -f1)
    if [[ "$EXT4_PARTITIONS" != "" ]]; then
        for P in $EXT4_PARTITIONS; do
            if mount $P /mnt; then
                if [[ -f /mnt/dandlessy-config ]]; then
                    FOSSIL_PARTITION=$P
                    DRIVE=$(lsblk -no pkname "$P")
                    DRIVE="/mnt/$DRIVE"
                    source /mnt/dandlessy-config
                    EXISTING_INSTALL="yes"
                    break;
                fi
            fi
            
            umount /mnt || true
        done
    fi
    
    umount /mnt || true
    
    if [[ -z "$DRIVE" ]]; then
        DRIVE_LIST=$(lsblk -dplnx size -o name,size \
                | grep -Ev "boot|rpmb|loop" | tac)
        DRIVE=$(dialog \
                --stdout \
                --menu "Select installation disk" 0 0 0 \
                ${DRIVE_LIST}) || exit 1
    fi
    
    if [[ "$ROOT_PARTITION" != "" ]]; then
        # Let's gather some data from the existing install before we format.
        mount "$ROOT_PARTITION" /mnt
        
        HOSTNAME=$(cat /mnt/etc/hostname || echo "")
        
        # I had hoped to just symlink /etc/shadow onto the fossil record
        # partition, but `useradd` and friends get ornery about that
        # (https://serverfault.com/a/491111), so if we've got an existing
        # /etc/shadow, let's copy it into memory so we can reestablish it after
        # the reinstall.
        if [[ -f /mnt/etc/shadow ]]; then
            OLD_SHADOW=$(cat /mnt/etc/shadow)
            
            if grep 'root:[^!*]' /mnt/etc/shadow; then
                ROOT_ESTABLISHED="yes"
            fi
        fi
        
        if [[ -f /mnt/etc/shadow ]]; then
            if grep "$MEDIA_BOX_USER"':[^!*]' /mnt/etc/shadow; then
                MBU_ESTABLISHED="yes"
            fi
        fi
        
        umount /mnt
    fi
    
    if [[ "$HOSTNAME" == "" ]]; then
        HOSTNAME=$(dialog --stdout --inputbox "Enter hostname" 0 0) || exit 1
    fi
    
    if [[ "$ROOT_ESTABLISHED" != "yes" ]]; then
        ROOT_PASSWORD=$( \
                dialog --stdout --inputbox "Enter root password" 0 0) \
                || exit 1
    fi
    
    if [[ "$MEDIA_BOX_USER" == "" ]]; then
        MEDIA_BOX_USER=$(
                dialog --stdout --inputbox "Enter media box user name" 0 0) \
                || exit 1
    fi
    
    if [[ "$MBU_ESTABLISHED" != "yes" ]]; then
        MEDIA_BOX_PASSWORD=$(dialog --stdout --inputbox \
                "Enter media box user password" 0 0) \
                || exit 1
    fi
    
    if [[ "$FOSSIL_PARTITION" == "" ]]; then
        if [[ "$BOOT_MODE" == "BIOS" ]]; then
            parted --script "${DRIVE}" -- mklabel gpt \
                    mkpart "\"GRUB boot partition\"" fat32 1Mib 2Mib \
                    set 1 bios_grub on \
                    mkpart "\"swap partition\"" linux-swap 2MiB 3816MiB \
                    mkpart "\"fossil partition\"" ext4 3816MiB 5246MiB \
                    mkpart "\"filesystem partition\"" ext4 5246MiB 100%
            
            mkswap "${DRIVE}2"
            
            FOSSIL_PARTITION="${DRIVE}3"
            ROOT_PARTITION="${DRIVE}4"
        else
            echo "Currently partitioning UEFI machines not implemented."
            exit 1
        fi
    else
        if [[ -z "$ROOT_PARTITION" ]]; then
            echo 'No ROOT_PARTITION defined in dandlessy-config.  :('
            exit 1
        fi
    fi
    
    mkfs.ext4 "$ROOT_PARTITION"
    
    if [[ "$(blkid -s TYPE -o value $FOSSIL_PARTITION)" != "ext4" ]]; then
        mkfs.ext4 "$FOSSIL_PARTITION"
    fi
    
    mkdir -p /mnt/fossil
    mount "$FOSSIL_PARTITION" /mnt/fossil
    mkdir -p /mnt/fossil/pacman-cache
    
    if [[ ! -f /mnt/fossil/dandlessy-config ]]; then
        cp default-dandlessy-config /mnt/fossil/dandlessy-config
        
        sed -i "s/{{media-box-user}}/$MEDIA_BOX_USER/g" \
                /mnt/fossil/dandlessy-config
        
        sed -i "s|{{root-partition}}|$ROOT_PARTITION|g" \
                /mnt/fossil/dandlessy-config
    fi
    
    mkdir -p /mnt/guest
    mount "$ROOT_PARTITION" /mnt/guest
    
    pacstrap -c /mnt/guest --cachedir "/mnt/fossil/pacman-cache" \
            base linux linux-firmware
    
    genfstab -U /mnt/guest >> /mnt/guest/etc/fstab
    echo "$HOSTNAME" > /mnt/guest/etc/hostname
    
    FOSSIL_PARTITION_UUID=$(blkid -s UUID -o value "$FOSSIL_PARTITION")
    echo "UUID=$FOSSIL_PARTITION_UUID /mnt/fossil ext4 defaults 0 2" \
            >> /mnt/guest/etc/fstab
    mkdir -p /mnt/guest/mnt/fossil
    
    # About to switch contexts into our chroot.  Let's make sure things are
    # available inside.
    
    # Our installer files.
    mkdir -p /mnt/guest/etc/mediabox-setup
    cp -a . /mnt/guest/etc/mediabox-setup
    
    chmod a+x /mnt/guest/etc/mediabox-setup/install-arch-chroot.sh
    arch-chroot /mnt/guest /etc/mediabox-setup/install-arch-chroot.sh \
            "x$ROOT_PASSWORD" "x$MEDIA_BOX_PASSWORD"
    
    # If we've got an OLD_SHADOW, let's reestablish it now that users have been
    # created.
    if [[ "$OLD_SHADOW" != "" ]]; then
        echo "$OLD_SHADOW" > /mnt/guest/etc/shadow
        chmod 600 /mnt/guest/etc/shadow
    fi
}

doInstall
