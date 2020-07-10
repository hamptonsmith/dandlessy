#!/bin/bash
set -e
set -x

install-aur https://aur.archlinux.org/google-chrome.git

# We want login cookes to survive reinstall, so let's link them onto the fossil
# record:

CHROME_STATE_PATH="/home/$MEDIA_BOX_USER/.config"
CHROME_STATE="$CHROME_STATE_PATH/google-chrome"

rm -rf "$CHROME_STATE" &> /dev/null || true
mkdir -p /mnt/fossil/chrome
chmod a+rw /mnt/fossil/chrome

sudo -u $MEDIA_BOX_USER -s <<AS_MBU
    mkdir -p "/mnt/fossil/chrome/state"
    mkdir -p "$CHROME_STATE_PATH"
    ln -s "/mnt/fossil/chrome/state" "$CHROME_STATE"
AS_MBU

