#!/usr/bin

INCLUDE='Include = /etc/pacman\.d/mirrorlist'

if lspci | grep -e VGA -e 3D | grep -i amd; then
    PACKAGE="xf86-video-amdgpu"
elif lspci | grep -e VGA -e 3D | grep -i ati; then
    PACKAGE="xf86-video-amdgpu"
elif lspci | grep -e VGA -e 3D | grep -i intel; then
    PACKAGE="xf86-video-intel"
elif lspci | grep -e VGA -e 3D | grep -i nvidia; then
    PACKAGE="xf86-video-nouveau"
fi

if [[ "$PACKAGE" != "" ]]; then
    pacman -S --noconfirm $PACKAGE
fi

sed -i "s|#\[multilib\]|\[multilib\]\n$INCLUDE|g" /etc/pacman.conf
pacman -Syu --noconfirm
pacman -S --noconfirm steam ttf-liberation

systemctl enable steam-link-download-dir.service
