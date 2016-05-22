Hacky way for persistent setxkbmap configuration when hot plugging input devices reset the settings.

https://superuser.com/questions/249064/udev-rule-to-auto-load-keyboard-layout-when-usb-keyboard-plugged-in/350336#350336

* Installation

Copy udev rule to `/etc/udev/rules.d/` and make sure the scripts in this dir have 755 permission.

    chmod 755 kbd_udev
    chmod 755 kbd
    cp 00-usb-keyboard.rules 00-usb-keyboard.rules
