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

# We want logins and two-factor authentications to persist between updates, so
# we symlink Steam user directories onto the fossil record.  Steam makes it
# challenging to just offload "user" files, so we're going to symlink quite a
# bit more than we might otherwise prefer.

rm -rf "/home/$MEDIA_BOX_USER/.local/share/Steam" || true
rm -rf "/home/$MEDIA_BOX_USER/.steam" || true

mkdir -p /mnt/fossil/steam
chmod a+rw /mnt/fossil/steam

sudo -u $MEDIA_BOX_USER -s <<AS_MBU
    mkdir -p /mnt/fossil/steam/dotlocal
    mkdir -p /mnt/fossil/steam/dotsteam
    mkdir -p "/home/$MEDIA_BOX_USER/.local/share"

    ln -s "/mnt/fossil/steam/dotlocal" \
            "/home/$MEDIA_BOX_USER/.local/share/Steam"
    ln -s "/mnt/fossil/steam/dotsteam" "/home/$MEDIA_BOX_USER/.steam"
AS_MBU
