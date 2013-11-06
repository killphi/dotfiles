# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific aliases and functions
[[ -f ~/.bash_functions ]] && . ~/.bash_functions
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

# Bundles first, then ~/bin, then ~/.local/bin, then global PATH
if [[ ! $PATH =~ "$HOME/.local/bin:$HOME/bin" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

PATH=$PATH:$HOME/node_modules/.bin
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
