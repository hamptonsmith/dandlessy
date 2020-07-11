#!/bin/bash
set -e
set -x

mount /mnt/fossil

systemctl enable NetworkManager.service

#############################
## Get variables into play ##
#############################

HOSTNAME=$(cat /etc/hostname)

ROOT_PARTITION=$(df -P / | tail -1 | cut -d' ' -f1)
DRIVE=$(lsblk -no pkname "$ROOT_PARTITION")
DRIVE="/dev/$DRIVE"

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

groupadd -r autologin
useradd -m -G autologin -s /bin/bash "$MEDIA_BOX_USER"

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

##############
## Clean up ##
##############

umount /mnt/fossil
