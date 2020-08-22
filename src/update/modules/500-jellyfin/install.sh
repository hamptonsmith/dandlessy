#!/bin/bash

pacman -S --noconfirm dotnet-runtime dotnet-sdk

install-nginx-location /tmp/jellyfin/jellyfin.conf
install-aur https://aur.archlinux.org/jellyfin.git
