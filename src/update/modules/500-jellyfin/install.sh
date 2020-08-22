#!/bin/bash

install-aur https://aur.archlinux.org/jellyfin-server-bin.git
install-aur https://aur.archlinux.org/jellyfin-web-bin.git

mkdir -p /mnt/fossil/config/jellyfin
chown jellyfin:jellyfin /mnt/fossil/config/jellyfin

mkdir -p /var/cache/jellyfin
chown jellyfin:jellyfin /var/cache/jellyfin

mkdir -p /var/db/jellyfin
chown jellyfin:jellyfin /var/db/jellyfin

mkdir -p /var/log/jellyfin
chown jellyfin:jellyfin /var/log/jellyfin

systemctl enable jellyfin.service

install-nginx-location /tmp/jellyfin/jellyfin.conf
