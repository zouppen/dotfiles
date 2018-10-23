On ubuntu 18.04, setup middle click emulation with 2 buttons and scroll by
forward button modifier by appending to 

/usr/share/X11/xorg.conf.d/40-libinput.conf

Following:

Section "InputClass"
        Identifier      "Marble Mouse"
        MatchProduct    "Logitech USB Trackball"
        Driver          "libinput"
        Option          "ScrollMethod" "button"
        Option          "ScrollButton" "9"
        Option          "MiddleEmulation" "on"
        Option "Emulate3Buttons" "true"
EndSection
