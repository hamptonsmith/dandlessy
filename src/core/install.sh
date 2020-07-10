#!/bin/bash
set -e
set -x

###############
## i3 config ##
###############

chmod a+r /tmp/i3/config
sudo -su $MEDIA_BOX_USER <<'AS_MBU'
    mkdir -p $HOME/.config/i3
    cp /tmp/i3/config $HOME/.config/i3/config    
AS_MBU

####################
## makepkg config ##
####################

echo 'PKGDEST=/mnt/fossil/aur-packages' >> /etc/makepkg.conf
mkdir -p /mnt/fossil/aur-packages
chmod a+rw /mnt/fossil/aur-packages

