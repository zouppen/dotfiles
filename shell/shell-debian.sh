# Shared shell configuration for debian systems. Sourced from eg. shell-mint.sh

export PATH="$PATH:$HOME/dotfiles/linux/bin"

alias aup="sudo apt-get update"
alias aug="sudo apt-get upgrade"

alias alog="less /var/log/apt/history.log"

alias open="xdg-open"
alias cbwd="pwd | cb"


alias say="espeak"
alias sano="espeak -v europe/fi"
alias sega="espeak -v europe/sv"

## Clipboard interop helpers
# Copy SSH public key
# alias cbssh="echo `gpgkey2ssh 2190701CC614FD52` | cb" && \
# Copy current working directory

# Copy most recent command in bash history
# alias cbhs="cat $HISTFILE | tail -n 2 | cb"


addppa () {
sudo add-apt-repository $1 
sudo apt-get update
}

alias postgre-start="sudo service postgresql start"
alias postgre-stop="sudo service postgresql stop"

source $HOME/dotfiles/shell/shell-common.sh
