# Shell environment requirements and customizations for working with Python

if (( ! $+commands[pip] )); then
    onlinux echo "Installing python-pip" && \
        sudo apt-get install python-pip python3-pip python-dev python3-dev
fi

alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"

# Python package manager
alias pipi="pip install"
alias pips="pip search"
alias pipr="pip uninstall"
alias pipf="pip freeze | tee requirements.txt"
alias pipfi="pip install -r requirements.txt"
# alias serve="python -m SimpleHTTPServer 3333"

# Python Virtualenv
# alias va="source ./venv/bin/activate"
# alias vc="virtualenv venv"
# alias vd="deactivate"
# alias vp="pip install -r requirements.txt"

# Use virtualenvwrapper which stores venvs in centralized fashion.

if (( ! $+commands[virtualenv] )); then
    echo "Installing virtualenv" && \
        sudo pip install virtualenv
fi    

if (( ! $+commands[virtualenvwrapper.sh] )); then
    echo "Installing virtualenvwrapper" && \
        sudo pip install virtualenvwrapper
fi    

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/dev/python

source virtualenvwrapper.sh
