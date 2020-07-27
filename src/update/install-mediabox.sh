#!/bin/bash

# Install the userspace mediabox application.
set -e
set -x

function pacmanPackages() {
    echo \
        accountsservice \
        base-devel \
        dmenu \
        dunst \
        git \
        i3-wm \
        jq \
        libnotify \
        lightdm \
        lightdm-gtk-greeter \
        nano \
        openssh \
        pulseaudio \
        pulseaudio-alsa \
        python \
        python-pip \
        rofi \
        sudo \
        wmctrl \
        xorg-server \
        xorg-xinit \
        xterm \
        zenity
}

function randomSlug() {
    cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 5 | head -n 1
}

function installModule() {
    echo "Installing module $1..."
    pushd .
    cd "$1"
    
    cp *.dandapp /etc/dandapps || true
    
    if [[ -d "home" ]]; then
        TMP_DIR=$(mktemp -d)
        cp -a home/* "$TMP_DIR"
        chown -R $MEDIA_BOX_USER:$MEDIA_BOX_USER "$TMP_DIR"
        cp -a "$TMP_DIR"/* "/home/$MEDIA_BOX_USER"
    fi
    
    if [[ -d "root" ]]; then
        cp -a root/* /
        
        # Make sure we haven't overwritten /tmp permissions...
        chmod a+trwx /tmp
    fi
    
    if [[ -d "root-bin" ]]; then
        cd "root-bin"
        if ls *; then
            for bin in *; do
                cp "$bin" "/usr/bin/$bin"
                chmod a+x "/usr/bin/$bin"
                
                # Allow `sudo` without a password for this script.
                echo "$MEDIA_BOX_USER ALL=(root) NOPASSWD: /usr/bin/$bin" \
                        > "/etc/sudoers.d/200-$MEDIA_BOX_USER-$bin"
            done
        fi
        cd ..
    fi
    
    if [[ -f "install.sh" ]]; then
        /bin/bash install.sh
        
        if [[ "$?" -ne "0" ]]; then
            echo 'Install script failed.'
            exit 1
        fi
    fi
    
    popd
}

function doInstall() {
    mount /mnt/fossil
    
    mkdir -p /etc/ssh
    ln -s /mnt/fossil/known_hosts /etc/ssh/ssh_known_hosts
    
    set -a
    source /mnt/fossil/dandlessy-config
    set +a
    
    pacman --noconfirm --needed -S $(pacmanPackages)
    
    sed -i "s/#autologin-user=/autologin-user=$MEDIA_BOX_USER/g" \
            /etc/lightdm/lightdm.conf
    sed -i 's/#autologin-session=/autologin-session=i3/g' \
            /etc/lightdm/lightdm.conf
    
    systemctl enable lightdm.service
    systemctl enable sshd
    
    # While we install modules, we want to allow hands-free running as the
    # media box user in particular, `makepkg` refuses to run as root, but will
    # often require `sudo`, making it challenging to automate.)  We'll change
    # this later to require a password like normal.
    echo "$MEDIA_BOX_USER ALL=(ALL) NOPASSWD:ALL" \
            > "/etc/sudoers.d/100-$MEDIA_BOX_USER-all"
    
    mkdir -p /etc/dandapps
    
    installModule /root/mediabox-setup/core
    
    if ls /root/mediabox-setup/modules/*; then
        for module in /root/mediabox-setup/modules/*; do
            installModule $module
        done
    fi
    
    # Scripts are all done, so lets reenable the password requirement for the
    # media box user moving forward.
    echo "$MEDIA_BOX_USER ALL=(ALL) ALL" \
            > "/etc/sudoers.d/100-$MEDIA_BOX_USER-all"
    
    chmod -R a+r /etc/dandapps
    
    # Snapshot of installed packages in case we want to revert to this install
    # in the future...
    TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
    mkdir -p /mnt/fossil/snapshots/$TIMESTAMP/
    pacman -Qet > /mnt/fossil/snapshots/$TIMESTAMP/packages
}

doInstall
