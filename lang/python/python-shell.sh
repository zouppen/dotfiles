# Shell customizations for working with Python

# Python package manager
alias pipi="pip install"
alias pips="pip search"
alias pipr="pip uninstall"
alias pipf="pip freeze | tee requirements.txt"
alias pipfi="pip install -r requirements.txt"
alias serve="python -m SimpleHTTPServer 3333"

# Python Virtualenv
# alias va="source ./venv/bin/activate"
# alias vc="virtualenv venv"
# alias vd="deactivate"
# alias vp="pip install -r requirements.txt"

# Use virtualenvwrapper which stores venvs in centralized fashion.
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/dev/python

source virtualenvwrapper.sh
