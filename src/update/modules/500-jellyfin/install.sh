#!/bin/bash

echo fs.inotify.max_user_watches=524288 | \
		sudo tee -a /etc/sysctl.d/99-sysctl.conf && sudo sysctl --system

install-nginx-location /tmp/jellyfin/jellyfin.conf
install-aur https://aur.archlinux.org/jellyfin.git
