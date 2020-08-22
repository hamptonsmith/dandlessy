#!/bin/bash

install-aur https://aur.archlinux.org/jellyfin-server-bin.git
install-aur https://aur.archlinux.org/jellyfin-web-bin.git

cp /tmp/jellyfin/system.xml /var/lib/jellyfin/config
chown jellyfin:jellyfin /var/lib/jellyfin/config
chmod 644 /var/lib/jellyfin/config/system.xml

systemctl enable jellyfin.service

install-nginx-location /tmp/jellyfin/jellyfin.conf
