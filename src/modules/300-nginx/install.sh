#!/bin/bash

NGINX_LOCATIONS_DIRECTORY='/etc/nginx/root-80-locations'

mkdir -p "$NGINX_LOCATIONS_DIRECTORY"

pacman -S --noconfirm --needed nginx-mainline
systemctl enable nginx.service

# Overwrite the default config.
cat /tmp/nginx/nginx.conf.template \
        | sed "s|{{locations-directory}}|$NGINX_LOCATIONS_DIRECTORY|g" \
        > /etc/nginx/nginx.conf

# Add an install utility
cat /tmp/nginx/install-nginx-location.template \
        | sed "s|{{locations-directory}}|$NGINX_LOCATIONS_DIRECTORY|g" \
        > /usr/bin/install-nginx-location
chmod +x /usr/bin/install-nginx-location
