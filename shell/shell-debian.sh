# Shared shell configuration for debian systems. Sourced from eg. shell-mint.sh

# plugins=(git autojump debian npm python pip pyenv screen sudo web-search extract)
source $HOME/dotfiles/shell/shell-common.sh
source $HOME/dotfiles/shell/shell-linux.sh

alias aup="sudo apt-get update"
alias aug="sudo apt-get upgrade"
alias addppa="sudo add-apt-repository"

alias postgre-start="sudo service postgresql start"
alias postgre-stop="sudo service postgresql stop"
