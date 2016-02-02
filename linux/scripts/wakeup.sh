#!/bin/bash -eu

# place symbolic link to /etc/pm/sleep.d/
# ln -s `pwd`/wakeup.sh /etc/pm/sleep.d/

case "${1}" in
    resume|thaw)
        /home/jarkko/dotfiles/linux/input-config.sh
        /home/jarkko/dotfiles/linux/bin/pledoff
;;
esac
