#!/bin/bash

install-aur https://aur.archlinux.org/jellyfin-server-bin.git
install-aur https://aur.archlinux.org/jellyfin-web-bin.git

mkdir -p /mnt/fossil/config
systemctl enable jellyfin.service

install-nginx-location /tmp/jellyfin/jellyfin.conf
