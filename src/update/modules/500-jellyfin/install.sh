#!/bin/bash

install-aur https://aur.archlinux.org/jellyfin-server-bin.git
install-aur https://aur.archlinux.org/jellyfin-web-bin.git

mkdir -p /mnt/fossil/config/jellyfin
chown jellyfin:jellyfin /mnt/fossil/config/jellyfin

systemctl enable jellyfin-config-gen.service
systemctl enable jellyfin.service

install-nginx-location /tmp/jellyfin/jellyfin.conf
