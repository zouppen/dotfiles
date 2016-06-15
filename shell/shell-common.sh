## Bash/Zsh modifications for Linux/OSX
# On OSX source this from .zshrc
# On Linux source a distro-specific file instead (eg. shell-mint.sh)  

# TODO fix stupidities
# source ~/dotfiles/lang/python/python-shell.sh

export PATH="$PATH:$HOME/bin:$HOME/dotfiles/bin"

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


# Rebind kill-region for zsh
bindkey '^w' kill-region

# Reload shell profile
alias rp="source ~/.zshrc"

alias ee="ec"  # Emacsclient
alias e="mg"   # Micro Gnu Emacs

# CDPATH=:$HOME/

alias cdd="cd ~/Desktop/"

# alias finddir='sudo find / -type d -name'
# alias findfile='sudo find / -type  -name'

alias cb="clipcopy"
alias cbp="clippaste"

alias cbssh="cat ~/.ssh/id_rsa.pub|cb"

onlinux \
    alias open="xdg-open" && \
    ## Clipboard interop helpers
    # Copy SSH public key
    # alias cbssh="echo `gpgkey2ssh 2190701CC614FD52` | cb" && \
    # Copy current working directory
    alias cbwd="pwd | cb"
    # Copy most recent command in bash history
    # alias cbhs="cat $HISTFILE | tail -n 2 | cb"

alias o="open ." && \

# Download subtitles, requires sudo pip install subliminal
alias sub="subliminal -l en --"

### Networking helpers
# Echo public IP
alias myip="curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"
# List open ports
alias ports="lsof -Pni4 | grep LISTEN"
alias speedtest="ping -c 3 www.funet.fi && wget -O /dev/null ftp://ftp.funet.fi/dev/100Mnull > /dev/null"

alias get-mp3="youtube-dl --extract-audio --audio-format mp3"
alias get-ogg="youtube-dl --extract-audio --audio-format vorbis"


# alias ga="git add"
# alias gp="git push"
# alias gl="git pull"
# alias gc="git commit"
# alias gcm="git commit -m"

# alias qc="git commit -a -m 'up' && git push"

# BFG Repo Cleaner https://rtyley.github.io/bfg-repo-cleaner/
# alias bfg="java -jar ~/dotfiles/bin/bfg-1.11.8.jar"


### Language translation utilities
# See also: Linux selection hotkeys on sxhkd config
# Using http://www.soimort.org/translate-shell/ depends on gawk
# Mac: brew install http://www.soimort.org/translate-shell/translate-shell.rb
# Linux: wget git.io/trans && chmod +x ./trans
alias te="trans fi:en"
alias tf="trans en:fi"
alias ts="trans fi:sv"
alias stf="trans sv:fi"

onlinux \
    alias say="espeak" && \
    alias sano="espeak -v europe/fi" && \
    alias sega="espeak -v europe/sv"


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
#bindkey "\e\e" sudo-command-line
