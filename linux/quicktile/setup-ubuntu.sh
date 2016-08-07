#!/bin/sh -xeu
### Install quicktile on Ubuntu 15.10
### https://github.com/ssokolow/quicktile

if (( ! $+commands[quicktile] )); then
    echo "Installing quicktile window manager" && \
        sudo apt-get install -y python python-gtk2 python-xlib python-dbus python-wnck && \
    mkdir -p $HOME/building && \
    cd $HOME/building && \
    git clone git://github.com/ssokolow/quicktile && \
    sudo mv quicktile /opt/ && \
    mkdir $HOME/bin && \
    ln -s /opt/quicktile/quicktile.py $HOME/bin/
    cd $HOME/bin/
    mv quicktile.py quicktile
    ln -s $HOME/dotfiles/linux/quicktile/quicktile.cfg $HOME/.config/
    echo "Add 'quicktile --daemonize' as a startup script."
    echo "To fix buggy terminator resizing, change it's settings:"
    echo "Terminator>Preferences>Global>Window geometry hints>OFF"
fi

