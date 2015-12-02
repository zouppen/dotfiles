## Bash/Zsh modifications for Linux/OSX
# On OSX source this from .zshrc
# On Linux source a distro-specific file instead (eg. shell-mint.sh)  

source $DOTFILES/lang/python/python-shell.sh
export PATH="$PATH:$HOME/bin"

# Prefix functions for applying conditionally based on system type
onlinux () { [ $(uname -s) = "Linux" ] && $* }
onmac () { [ $(uname -s) = "Darwin" ] && $* }
# Eg. `onmac echo "Yes!" && echo "No!"`
# Should echo Yes! and No! on Mac and do nothing on Linux.

# Reload shell profile
alias rp="source ~/.zshrc"

### Everyday file operations etc.
take () {
  mkdir -p $1
  cd $1
}
alias cdd="cd ~/Desktop/"
alias cddo="cd ~/Documents/"
alias ...="cd ../../"
alias ....="cd ../../../"
# alias finddir='sudo find / -type d -name'
# alias findfile='sudo find / -type  -name'
onlinux \
    alias open="xdg-open" && \
    ## Clipboard interop helpers
    # Copy SSH public key
    alias cbssh="echo `gpgkey2ssh 2190701CC614FD52` | cb" && \
    # Copy current working directory
    alias cbwd="pwd | cb"
    # Copy most recent command in bash history
    # alias cbhs="cat $HISTFILE | tail -n 2 | cb"

onmac \
    alias o="open ." && \
    alias lsblk="diskutil list" && \
    alias lsusb="system_profiler SPUSBDataType" && \
    alias cb="pbcopy" && \
    alias cbwd="pwd|pbcopy" && \
    alias cbssh="cat ~/.ssh/id_rsa.pub|pbcopy"

# Download subtitles, requires sudo pip install subliminal
alias sub="subliminal -l en --"

### Unified operating system package manager commands
onmac \
    alias ai="brew install" && \
    alias ar="brew uninstall" && \
    alias as="brew search" && \
    alias cask="brew cask" && \
    alias aii="brew cask install" && \
    alias ass="brew cask search" && \
    alias aup="brew update" && \
    alias aug="brew upgrade"

### Networking helpers
# Echo public IP
alias myip="curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"
# List open ports
alias ports="lsof -Pni4 | grep LISTEN"
alias speedtest="ping -c 3 www.funet.fi && wget -O /dev/null ftp://ftp.funet.fi/dev/100Mnull > /dev/null"

alias get-mp3="youtube-dl --extract-audio --audio-format mp3"
alias get-ogg="youtube-dl --extract-audio --audio-format vorbis"

# Git quick commit
alias qc="git commit -a -m 'up' && git push"
# BFG Repo Cleaner https://rtyley.github.io/bfg-repo-cleaner/
alias bfg="java -jar ~/dotfiles/bin/bfg-1.11.8.jar"

onmac \
    # Toggle PostgreSQL service state
    alias postgre-start="launchctl load /usr/local/opt/postgresql/homebrew.mxcl.postgresql.plist" && \
    alias postgre-stop="launchctl unload /usr/local/opt/postgresql/homebrew.mxcl.postgresql.plist"

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

onmac \
    alias sano="say -v \"Mikko\"" && \
    alias sega="say -v \"Oskar\""


# ESC-ESC to sudo last command
sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    if [[ $BUFFER == sudo\ * ]]; then
        LBUFFER="${LBUFFER#sudo }"
    else
        LBUFFER="sudo $LBUFFER"
    fi
}
zle -N sudo-command-line
# Defined shortcut keys: [Esc] [Esc]
bindkey "\e\e" sudo-command-line

# last-working-dir plugin from Oh-My-Zsh
# Keeps track of the last used working directory and automatically jumps
# into it for new shells.
ZSH_CACHE_DIR=$HOME/.zprezto/cache/
# Flag indicating if we've previously jumped to last directory.
typeset -g ZSH_LAST_WORKING_DIRECTORY
mkdir -p $ZSH_CACHE_DIR
cache_file="$ZSH_CACHE_DIR/last-working-dir"

# Updates the last directory once directory is changed.
chpwd_functions+=(chpwd_last_working_dir)
function chpwd_last_working_dir() {
  # Use >| in case noclobber is set to avoid "file exists" error
	pwd >| "$cache_file"
}

# Changes directory to the last working directory.
function lwd() {
	[[ ! -r "$cache_file" ]] || cd "`cat "$cache_file"`"
}

# Automatically jump to last working directory unless this isn't the first time
# this plugin has been loaded.
if [[ -z "$ZSH_LAST_WORKING_DIRECTORY" ]]; then
	lwd 2>/dev/null && ZSH_LAST_WORKING_DIRECTORY=1 || true
fi
