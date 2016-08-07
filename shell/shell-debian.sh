# Shared shell configuration for debian systems. Sourced from eg. shell-mint.sh

export PATH="$PATH:$HOME/dotfiles/linux/bin"

alias aup="sudo apt-get update"
alias aug="sudo apt-get upgrade"

alias alog="less /var/log/apt/history.log"

addppa () {
sudo add-apt-repository $1 
sudo apt-get update
}

alias postgre-start="sudo service postgresql start"
alias postgre-stop="sudo service postgresql stop"

source $HOME/dotfiles/shell/shell-common.sh
