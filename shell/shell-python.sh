# Shell environment requirements and customizations for working with Python

if (( ! $+commands[pip] )); then
    onlinux echo "Installing python-pip" && \
        sudo apt-get install python-pip python3-pip python-dev python3-dev
    onmac echo "Config shell-python broken. Setup python pip properly."
    exit 1
fi


if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

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

if (( ! $+commands[virtual*env] )); then
    echo "Installing virtualenv" && \
        sudo pip install virtualenv
fi    

onmac VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python

if (( ! $+commands[virtualenvwrapper.sh] )); then
    echo "Installing virtualenvwrapper" && \
        sudo pip install virtualenvwrapper
fi


if (( ! $+commands[subliminal] )); then
    echo "Installing subliminal" && \
        sudo pip install subliminal
fi

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/dev/python

source virtualenvwrapper.sh
