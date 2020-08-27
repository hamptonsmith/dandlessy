#!/bin/bash

set -e

source /mnt/fossil/dandlessy-config

docker pull jellyfin/jellyfin
systemctl enable jellyfin.service

mkdir -p /mnt/fossil/config/jellyfin
chown $MEDIA_BOX_USER:$MEDIA_BOX_USER /mnt/fossil/config/jellyfin

install-nginx-location /tmp/jellyfin/jellyfin.conf
