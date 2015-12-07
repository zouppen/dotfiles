#!/bin/sh -f
### Linux system startup script to setup input devices ###
# Run as sudo to get everything working

# Disable bell
xset b off

##### Keyboard
# Keylayout
setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl -option
# Note: Set via dpkg-reconfigure if fails.
# sudo dpkg-reconfigure keyboard-configuration
#      -> us alt international dead keys

# Apply custom layout customizations for modifier keys & äö key.
xmodmap /home/`awk -F':' '{ print $1}' /etc/passwd | grep ja`/dotfiles/linux/Xmodmap

# Key repeat delay and rate
xset r rate 170 25

##### Mouses
echo -n 255 > /sys/devices/platform/i8042/serio1/serio2/sensitivity
echo -n 255 > /sys/devices/platform/i8042/serio1/serio2/speed

### Kensington Expert Mouse trackball
xinput set-button-map "Kensington      Kensington Expert Mouse" 1 8 3 4 5 6 7 2 9 10 11 12
xinput set-prop "Kensington      Kensington Expert Mouse" "Evdev Wheel Emulation" 1
xinput set-prop "Kensington      Kensington Expert Mouse" "Evdev Wheel Emulation Axes" 7 6 5 4
xinput set-prop "Kensington      Kensington Expert Mouse" "Evdev Wheel Emulation Inertia" 20

## Natural scrolling (vert, horiz) with trackpoint and touchpad ##
# Written on (X)ubuntu 15.10, TP X220

## Research notes:
# What input devices do we have:
# $> xinput list
# SynPS/2 Synaptics TouchPad id=10 [slave  pointer  (2]
# TPPS/2 IBM TrackPoint id=17 [slave  pointer  (2)]

# What are the scrollwheel buttons
# $> xinput test [id]
# wheel buttons are: horiz 4,5 vert 6,7

# Remap scroll emulation axes for trackpoint

xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 7 6 5 4

# Reverse the scroll distance setting on touchpad
# Remember to disable natural scroll in system preferences
# $> xinput list-props "SynPS/2 Synaptics TouchPad"
# Synaptics Scrolling Distance (272): 100, 100
xinput set-prop "SynPS/2 Synaptics TouchPad" "Synaptics Scrolling Distance" -100 -100

# Coasting sucks when using ctrl after scrolling a web-page
xinput set-prop "SynPS/2 Synaptics TouchPad" "Synaptics Coasting Speed" 0 0

# Disable sucky clickpad (ClickPad) 
# xinput set-prop "SynPS/2 Synaptics TouchPad" 268 0
