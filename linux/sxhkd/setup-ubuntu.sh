#!/bin/sh -xeu
### Install sxhkd on Ubuntu 15.10
### https://github.com/baskerville/sxhkd

DOTFILES=~/dotfiles/

if (( ! $+commands[sxhkd] )); then
    echo "Installing deps"
    sudo apt-get install -y python-keybinder xsel
    echo "Installing sxhkd."
    ln -s $DOTFILES/linux/sxhkd ~/.config/ && \
    sudo apt-get install -y libxcb1-dev libxcb-keysyms1-dev libxcb-util0-dev && \
    mkdir -p $HOME/building/ && \
    cd $HOME/.building/ && \
    git clone https://github.com/baskerville/sxhkd.git && \
    cd $HOME/.building/ && \
    cd sxhkd && \
    make && \
    sudo make install
fi
sudo apt-get install -y xsel wmctrl
echo "please install trans, notify-pipe, gspeak,"
