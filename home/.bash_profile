# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

# VIm is my (visual) editor
VISUAL="/usr/bin/vim"
EDITOR=$VISUAL
export VISUAL EDITOR

# unset history
unset HISTFILE

# git prompt
[[ $- =~ i ]] && . $HOME/Versioning/.homesick-dep/git-prompt/git-prompt.sh

eval `dircolors ~/.dir_colors`


# RVM line
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
