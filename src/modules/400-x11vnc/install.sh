#!/bin/bash

pacman -S --noconfirm x11vnc
systemctl enable x11vnc.service
