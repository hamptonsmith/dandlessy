#!/bin/bash
set -e
set -x

function pacmanPackages() {
    echo \
        grub \
        intel-ucode \
        networkmanager
}

mount /mnt/fossil

#############################
## Get variables into play ##
#############################

HOSTNAME=$(cat /etc/hostname)

ROOT_PARTITION=$(df -P / | tail -1 | cut -d' ' -f1)
DRIVE=$(lsblk -no pkname "$ROOT_PARTITION")
DRIVE="/dev/$DRIVE"

ROOT_PASSWORD="${1:1}"
MEDIA_BOX_PASSWORD="${2:1}"

if ls /sys/firmware/efi/efivars &> /dev/null; then
    BOOT_MODE="UEFI"
else
    BOOT_MODE="BIOS"
fi

source /mnt/fossil/dandlessy-config

#####################
## Time and Locale ##
#####################

ln -sf /usr/share/zoneinfo/US/Eastern /etc/localtime
hwclock --systohc
timedatectl set-ntp true

sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' > /etc/locale.conf

#######################
## Users / passwords ##
#######################

if [[ "$ROOT_PASSWORD" != "" ]]; then
    echo "root:$ROOT_PASSWORD" | chpasswd
fi

groupadd -r autologin
useradd -m -G autologin -s /bin/bash "$MEDIA_BOX_USER"

if [[ "$MEDIA_BOX_PASSWORD" != "" ]]; then
    echo "$MEDIA_BOX_USER:$MEDIA_BOX_PASSWORD" | chpasswd
fi

################
## /etc/hosts ##
################

echo '127.0.0.1 localhost'                        > /etc/hosts
echo '::1'                                       >> /etc/hosts
echo "127.0.1.1 $HOSTNAME.localdomain $HOSTNAME" >> /etc/hosts

##################
## Setup pacman ##
##################

# Cache installed arch packages into the fossil record so we're not
# redownloading things we've gotten before
sed -i 's|#CacheDir *=.*|CacheDir=/mnt/fossil/pacman-cache/|g' /etc/pacman.conf

##########################################
## Install packages and enable services ##
##########################################

pacman --noconfirm --needed -S $(pacmanPackages)
systemctl enable NetworkManager.service

##########
## GRUB ##
##########

if [[ "$BOOT_MODE" == "BIOS" ]]; then
    grub-install --recheck --target=i386-pc $DRIVE
else
    pacman --noconfirm --needed -S efibootmgr
    grub-install \
            --recheck \
            --target=x86-efi \
            --efi-directory=/boot \
            --bootloader-id=GRUB
fi

mkdir -p /boot/grub && grub-mkconfig -o /boot/grub/grub.cfg

##############
## Clean up ##
##############

umount /mnt/fossil
