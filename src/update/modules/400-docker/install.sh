#!/bin/bash

pacman -S --noconfirm docker
systemctl enable docker.service
systemctl start docker.service
