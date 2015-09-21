## Bash/Zsh modifications for Linux/OSX

# Reload shell profile
alias rp="source ~/.zshrc"

# Download subtitles
alias sub="subliminal -l en --"

# Echo public IP
alias ipext="curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"

#eval "$(hub alias -s)"

alias finddir='sudo find / -type d -name'
alias findfile='sudo find / -type  -name'

# Emacsclient GUI
alias ec="emacsclient -n"

# Emacsclient terminal
alias ect="emacsclient -t"

# Quick commit
alias qc="git commit -a -m 'up' && git push"

# BFG Repo Cleaner https://rtyley.github.io/bfg-repo-cleaner/
alias bfg="java -jar ~/konffit/bin/bfg-1.11.8.jar"

#CD's
alias cdd="cd ~/Desktop/"
alias cddo="cd ~/Documents/"

# http://www.soimort.org/translate-shell/
# brew install http://www.soimort.org/translate-shell/translate-shell.rb
alias te="trans fi:en"
alias tf="trans en:fi"
alias ts="trans fi:sv"
alias stf="trans sv:fi"
