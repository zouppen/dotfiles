#!/bin/bash -eux
# Setup stuff from scratch

####
#### NOT WORKING YET ####
####

# Prefix functions for applying conditionally based on system type
# onlinux () { [ $(uname -s) = "Linux" ] && $* }
onmac () { [ $(uname -s) = "Darwin" ] && $& }

DOTFILES=$HOME/dotfiles

# Install dependencies
# onmac brew install git

