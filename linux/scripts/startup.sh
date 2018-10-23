#!/bin/sh
# Startup script for Ubuntu 16.04

sudo /home/jasalt/dotfiles/linux/bin/pledoff
sudo /home/jasalt/dotfiles/linux/input-config.sh &

#if pgrep -f quicktile > /dev/null
#then
#    echo "Quicktile already running"
#else
#    quicktile --daemonize >> /home/jasalt/.log/quicktile.log 2>&1
#fi

if pgrep -f sxhkd > /dev/null
then
    echo "Sxhkd already running"
    killall sxhkd && sxhkd >> /home/jasalt/.log/sxhkd.log 2>&1
else
    sxhkd &
    # >> /home/jasalt/.log/sxhkd.log 2>&1
fi


# if pgrep -f thinkfan > /dev/null
# then
#     echo "Thinkfan already running"
# else
#     sudo thinkfan
# fi
