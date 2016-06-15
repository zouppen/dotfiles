#!/bin/bash -eux

# Install stable emacs on ubuntu, see readme for notes.

# uncomment first dep-src line in /etc/apt/sources.list if missing
sudo apt-get build-dep -y emacs24

sudo apt-get install -y build-essential fonts-inconsolata

wget http://ftp.gnu.org/gnu/emacs/emacs-24.5.tar.xz
tar -xvf emacs-24.5.tar.xz
cd emacs-24.5

./configure
make
sudo make install

cd ..
sudo cp Emacs-24.desktop /usr/share/applications/
rm emacs-24.5.tar.xz
rm -rf emacs-24.5
