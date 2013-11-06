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
. $HOME/Versioning/git/git-prompt/git-prompt.sh

# local tools
for i in ~/.local/tools/*/functions
  do . $i
done

eval `dircolors ~/.dir_colors`


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
