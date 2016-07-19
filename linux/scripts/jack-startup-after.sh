#!/bin/sh
# Run after jack startup

amixer -c AMX set "PCM",0 100%
amixer -c AMX set "PCM",1 100%
pactl load-module module-jack-sink
sudo pactl load-module module-bluez5-device

aplay /home/jasalt/dotfiles/media/jackdahouse.wav

echo "`date` AMX-vol-max" >> /home/jasalt/.log/debug

