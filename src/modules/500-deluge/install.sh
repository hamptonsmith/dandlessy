#!/bin/bash

pacman -S --needed --noconfirm deluge
systemctl enable deluge-config-gen.service
systemctl enable deluged.service
systemctl enable deluge-web.service

chown deluge:deluge /etc/deluge/core.conf.template
chown deluge:deluge /etc/deluge/web.conf.template

install-nginx-location /tmp/deluge/deluge.conf
