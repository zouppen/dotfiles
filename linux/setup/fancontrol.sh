#!/bin/sh -xeu

# Set Thinkpad X220 silent during normal use. Script not tested yet.

# Sources
# http://askubuntu.com/questions/22108/how-to-control-fan-speed
# http://www.thinkwiki.org/wiki/How_to_control_fan_speed#Automated_control_scripts
# Notes:
# - # sudo echo level 1 > /proc/acpi/ibm/fan" is handy for testing.
# - Fancontrol package's command `pwmconfig` wizard is handy for generating config file.

if (( ! $+commands[fancontrol] )); then
    echo "Installing fancontrol management" && \
        sudo apt-get update && \
        sudo apt-get install -y fancontrol lm-sensors && \
        sudo echo "options thinkpad_acpi fan_control=1" > /etc/modprobe.d/thinkpad_acpi.conf && \
        echo "Fan is set to be controllable (requires reboot)." && \
        sudo ln -s ~/dotfiles/linux/setup/fancontrol.conf /etc/fancontrol && \
        sudo service fancontrol start && \
        echo "Fancontrol config symlinked and service started. Effective after REBOOT."
fi

