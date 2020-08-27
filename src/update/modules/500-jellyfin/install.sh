#!/bin/bash

docker pull jellyfin/jellyfin
systemctl enable jellyfin.service

mkdir -p /mnt/fossil/config/jellyfin
chown jellyfin:jellyfin /mnt/fossil/config/jellyfin

install-nginx-location /tmp/jellyfin/jellyfin.conf
