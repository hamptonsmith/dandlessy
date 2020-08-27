#!/bin/bash

set -e

pacman -S --noconfirm docker
systemctl enable docker.service

