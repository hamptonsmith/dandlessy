#!/bin/bash
set -e
set -x

if [[ ! -f /mnt/fossil/dandlessy-config ]]; then
    echo 'Must have mounted /mnt/fossil.'
    exit 1
fi

ROOT_PARTITION="$1"
HOSTNAME="$2"
BOOTSTRAP_FROM="$3"
BOOTSTRAP_CMD="$4"

mkdir -p /mnt/guest
mkfs.ext4 "$ROOT_PARTITION"
mount "$ROOT_PARTITION" /mnt/guest

pacstrap -c /mnt/guest --cachedir "/mnt/fossil/pacman-cache" \
        base linux linux-firmware

genfstab -U /mnt/guest >> /mnt/guest/etc/fstab
echo "$HOSTNAME" > /mnt/guest/etc/hostname

# Our chroot bootstrap files.
mkdir -p /mnt/guest/root/bootstrap
cp -a . "$BOOTSTRAP_FROM" /mnt/guest/root/bootstrap
chmod a+x "/mnt/guest/root/bootstrap/$BOOTSTRAP_CMD"

# Do the thing!
arch-chroot /mnt/guest "/root/bootstrap/$BOOTSTRAP_CMD" ${@:5}

