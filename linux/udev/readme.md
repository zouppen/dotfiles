# Debugging 
Enable logging to syslog

    udevadm control --log-priority=debug

Return normal logging (/etc/udev/udev.conf tells it)

    udevadm control --log-priority=info


"Starting daemons or other long-running processes is not appropriate for udev; the forked processes, detached or not, will be unconditionally killed after the event handling has finished."

# Setup 

*GDM kbd management keeps overriding this*: `gsettings set org.gnome.settings-daemon.plugins.keyboard active false`

General information on topic http://www.reactivated.net/writing_udev_rules.html#example-camera

Installing rules:

Copy udev rule to `/etc/udev/rules.d/` and make sure the scripts in this dir have 755 permission.

    chmod 755 kbd_udev
    chmod 755 kbd
    cp 00-usb-keyboard.rules /etc/udev/rules.d/00-usb-keyboard.rules


## 00-usb-keyboard.rules
Hacky way for persistent setxkbmap configuration when hot plugging input devices reset the settings.

https://superuser.com/questions/249064/udev-rule-to-auto-load-keyboard-layout-when-usb-keyboard-plugged-in/350336#350336
