#!/bin/sh
# startup script for mint 17.3

sudo /home/jarkko/dotfiles/linux/bin/pledoff
sudo /home/jarkko/dotfiles/linux/input-config.sh &

if pgrep -f quicktile > /dev/null
then
    echo "Quicktile already running"
else
    quicktile --daemonize &
fi

if pgrep -f sxhkd > /dev/null
then
    echo "Sxhkd already running"
    killall sxhkd && sxhkd &
else
    sxhkd &
fi

if pgrep -f thinkfan > /dev/null
then
    echo "Thinkfan already running"
else
    sudo thinkfan
fi
