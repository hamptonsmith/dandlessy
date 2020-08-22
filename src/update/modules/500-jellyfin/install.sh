#!/bin/bash

install-aur https://aur.archlinux.org/jellyfin-server-bin.git
install-aur https://aur.archlinux.org/jellyfin-web-bin.git

# Jellyfin won't init if its config directory already exists :eyeroll:, so we start it, let it
# generate its config file, then stop it and perform surgery in-place.
systemctl start jellyfin.service
sleep 2
systemctl stop jellyfin.service
sed -i 's:<BaseUrl />:<BaseUrl>/media</BaseUrl>:g' \
		/var/lib/jellyfin/config/system.xml
sed -i 's:<IsStartupWizardCompleted>false:<IsStartupWizardCompleted>true:g' \
		/var/lib/jellyfin/config/system.xml

systemctl enable jellyfin.service

install-nginx-location /tmp/jellyfin/jellyfin.conf
