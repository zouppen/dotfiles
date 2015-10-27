#!/bin/sh -xeu

# Setup TLP laptop power management and powertop electricity gauge

if (( ! $+commands[tlp] )); then
    echo "Installing TLP power management" && \
    # sudo add-apt-repository -y ppa:linrunner/tlp && \  ## 15.10 has these in repo?
    # sudo apt-get update && \
    sudo apt-get install -y tlp tlp-rdw tp-smapi-dkms acpi-call-dkms powertop && \
    sudo tlp start
fi

