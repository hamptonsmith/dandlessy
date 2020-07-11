#!/bin/bash

function doInstall() {
    source install-arch.sh

    cp ./install-mediabox.sh /mnt/guest/etc/install-mediabox.sh
    chmod a+x /mnt/guest/etc/install-mediabox.sh
    arch-chroot /mnt/guest /etc/install-mediabox.sh
}

doInstall
