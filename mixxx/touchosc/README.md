# Mixxx TouchOSC layout and mapping script.

Mapping to use the TouchOSC Jog-On iPad template to control the Mixxx DJ software.

Designed for use with Akai AMX, providing jog controllers and a couple less important controls.

# Installation on OSX

- ln -s `pwd`/Touch* ~/Library/ApplicationSupport/Mixxx/controllers/
- ln -s ~/dotfiles/mixxx/touchosc/TouchOSC-iPad-scripts.js /Applications/Mixxx.app/Contents/Resources/controllers/

- Upload .touchosc file with TouchOSC Editor to device
- Run and enable TouchOSC midi bridge on Mixxx controller settings

# TODO

# Resources
Run Mixxx in controller debug mode: `/Applications/Mixxx.app/Contents/MacOS/Mixxx --controllerDebug`

- Mapping jog wheel https://www.youtube.com/watch?v=QUT8tZmwM00
