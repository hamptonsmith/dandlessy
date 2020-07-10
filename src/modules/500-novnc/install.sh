#!/bin/bash

install-aur https://aur.archlinux.org/novnc.git
systemctl enable novnc.service

install-nginx-location /tmp/novnc/novnc.conf
