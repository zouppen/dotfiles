# Mixxx DJ software custom settings for Thinkpad X220 & Akai AMX three deck setup
Use X220 keyboard's three function key rows for three decks pitch/nudge and create a 4x4 button grid for each deck having essential loop/jump/cue controls and play/cue for the third deck.

AMX is used for most important controls for the two main decks. The third "keyboard only deck" is stripped down and aimed for basic playback.

Later there should be a three deck skin for low resolution display to accomodate the mapping, showing eq&fader for just the third keyboard only deck.

## Customizing keybindings
http://mixxx.org/forums/viewtopic.php?f=9&t=4471
Available controls: http://www.mixxx.org/wiki/doku.php/mixxxcontrols

Copy/link Custom.kbd.cfg to Mixxx user config dir

- Linux: ~/.mixxx/Custom.kbd.cfg 
  - `ln ./Custom.kbd.cfg ~/.mixxx/Custom.kbd.cfg`
- MacOSX: /Library/Application\ Support/Mixxx/Custom.kbd.cfg
- Windows: %USERPROFILE%\Local Settings\Application 

## Missing controls from default mapping:
- Fixing beatgrid
- Preset length loops/rolls
- Beatjumps
- More hotcues (using ctrl modifier)
- Third deck

## Controls to be thrown a way (using AMX)
- Deck 1/2 play & cue
- Crossfader
- Low kill

# TODO

- [x] Initial mapping file loading
- [ ] Remap 2 deck buttons
    - [ ] Unable to remap hotcue keys
- [ ] Map third deck
    - [ ] Change F11 fullscreen button, map to third deck's nudge https://github.com/mixxxdj/mixxx/blob/e59916caf72a256bb28b1722759a629c5cc9cf81/src/widget/wmainmenubar.cpp

# Notes
    Debug [Main]: Found and will use custom keyboard preset "/home/jasalt/.mixxx/Custom.kbd.cfg" 
