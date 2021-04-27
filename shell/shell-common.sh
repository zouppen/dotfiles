## Bash/Zsh modifications for Linux/OSX
# On OSX source this from .zshrc
# On Linux source a distro-specific file instead (eg. shell-mint.sh)  

source ~/dotfiles/shell/shell-python.sh

export PATH="$PATH:$HOME/.bin:$HOME/dotfiles/bin"
# CDPATH=:$HOME/

# Prefix functions for applying conditionally based on system type
onlinux () { [ $(uname -s) = "Linux" ] && $* }
onmac () { [ $(uname -s) = "Darwin" ] && $* }
# Eg. `onmac echo "Yes!" && echo "No!"`
# Should echo Yes! and No! on Mac and do nothing on Linux.

# Enable character expansion
setopt braceccl
# Allow empty glob entries
setopt null_glob
# Allow empty glob entries
setopt extended_glob

set -o ignoreeof

autoload bashcompinit
bashcompinit

# wp-cli completion
source ~/dotfiles/shell/completion/wp-completion.bash

# Rebind kill-region for zsh
bindkey '^w' kill-region

# Reload shell profile
alias rp="source ~/.zshrc"
alias sl="ls"
alias e="mg"   # Micro Gnu Emacs

function abspath() {
    # generate absolute path from relative path
    # $1     : relative filename
    # return : absolute path
    if [ -d "$1" ]; then
        # dir
        (cd "$1"; pwd)
    elif [ -f "$1" ]; then
        # file
        if [[ $1 == */* ]]; then
            echo "$(cd "${1%/*}"; pwd)/${1##*/}"
        else
            echo "$(pwd)/$1"
        fi
    fi
}

alias pfp="abspath"
alias cbfp="$(abspath $1) | pbcopy"

alias cdd="cd ~/Desktop/"

# alias finddir='sudo find / -type d -name'
# alias findfile='sudo find / -type  -name'

alias cb="clipcopy"
alias cbp="clippaste"

alias cbssh="cat ~/.ssh/id_rsa.pub|cb"
    
# Download subtitles, requires sudo pip install subliminal
alias sub="subliminal download -l en"

### Networking helpers
# Echo public IP
alias myip="curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"
# List open ports
alias ports="lsof -Pni4 | grep LISTEN"
alias speedtest="ping -c 3 www.funet.fi && wget -O /dev/null ftp://ftp.funet.fi/dev/100Mnull > /dev/null"

alias get-mp3="youtube-dl --extract-audio --audio-format mp3"
alias get-ogg="youtube-dl --extract-audio --audio-format vorbis"

## These are on ohmyzsh
# alias ga="git add"
# alias gp="git push"
# alias gl="git pull"
# alias gc="git commit"
# alias gcm="git commit -m"

alias qc="git commit -a -m 'up' && git push"

# BFG Repo Cleaner https://rtyley.github.io/bfg-repo-cleaner/
alias bfg="java -jar ~/dotfiles/bin/bfg-1.11.8.jar"

### Language translation utilities
# See also: Linux selection hotkeys on sxhkd config
# Using http://www.soimort.org/translate-shell/ depends on gawk
# Mac: brew install http://www.soimort.org/translate-shell/translate-shell.rb
# Linux: wget git.io/trans && chmod +x ./trans
alias te="trans fi:en"
alias tf="trans en:fi"
alias ts="trans fi:sv"
alias stf="trans sv:fi"

# ESC-ESC to sudo last command
sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    if [[ $BUFFER == sudo\ * ]]; then
        LBUFFER="${LBUFFER#sudo }"
    else
        LBUFFER="sudo $LBUFFER"
    fi
}
#zle -N sudo-command-line
# Defined shortcut keys: [Esc] [Esc]
source ~/dotfiles/shell/shell-fun.zsh

