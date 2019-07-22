#!/bin/sh
# Emacsclient script
# Requires replacing emacsclient and emacs emacs binaries with symlinks to the used emacs gui version (needs SIP disabled on mac)
# Eg. /Applications/Emacs.app/Contents/MacOS/bin/emacs
# Eg. /Applications/Emacs.app/Contents/MacOS/bin/emacsclient

if [ "$(pidof emacs)" ] ; then
    emacsclient -n -s ~/.emacs.d/server/jarkon-emacs "$@"
else
    emacs -mm "$@" &
fi
