#!/bin/bash
set -e
set -x

sudo -su $MEDIA_BOX_USER <<'AS_MBU'
    pip3 install i3ipc
AS_MBU

#####################
## dirctory layout ##
#####################

mkdir -p /mnt/fossil/config
chmod a+rwt /mnt/fossil/config

mkdir -p /mnt/fossil/cache
chmod a+rwt /mnt/fossil/cache

####################
## makepkg config ##
####################

echo 'PKGDEST=/mnt/fossil/aur-packages' >> /etc/makepkg.conf
mkdir -p /mnt/fossil/aur-packages
chmod a+rw /mnt/fossil/aur-packages

################
## pulseaudio ##
################

echo 'load-module module-switch-on-connect' >> /etc/pulse.default.pa
sudo -su $MEDIA_BOX_USER <<'AS_MBU'
    mkdir -p $HOME/.config/pulseaudio-ctl
    cp /tmp/pulseaudio-ctl/config $HOME/.config/pulseaudio-ctl/config
AS_MBU

####################
## pulseaudio-ctl ##
####################

install-aur https://aur.archlinux.org/pulseaudio-ctl.git
