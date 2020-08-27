#!/bin/bash

pacman -S --noconfirm docker
systemctl enable docker.service

