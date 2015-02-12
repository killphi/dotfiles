# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific aliases and functions
[[ -f ~/.bash_functions ]] && . ~/.bash_functions
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

# PATH modifications
if [[ ! $PATH =~ "$HOME/node_modules/.bin" ]]; then
  PATH=$HOME/node_modules/.bin:$PATH
fi

if [[ ! $PATH =~ "$HOME/bin" ]]; then
  PATH=$HOME/bin:$PATH
fi

if [[ ! $PATH =~ "$HOME/.local/bin" ]]; then
  PATH=$HOME/.local/bin:$PATH
fi

# RVM line
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
