#!/bin/bash

install-aur https://aur.archlinux.org/dotnet-core-3.0.git
install-aur https://aur.archlinux.org/dotnet-core-3.0.git

install-nginx-location /tmp/jellyfin/jellyfin.conf
install-aur https://aur.archlinux.org/jellyfin.git
