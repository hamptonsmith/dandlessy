#!/bin/bash

set -e

install-aur https://aur.archlinux.org/websockify.git
install-nginx-location /tmp/websockify/novnc.conf
