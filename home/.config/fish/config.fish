source /etc/fish/config.fish
source ~/.config/fish/aliases.fish

set -g fish_color_user green
set -g fish_color_host cyan

set -x PATH ~/.local/bin ~/bin $PATH ~/.rvm/bin ~/node_modules/.bin

# this is fucked up
#set -x LS_COLORS (dircolors ~/.dir_colors | cut -d\n -f1 | sed -e 's/.*\'\(.*\)\'.*/\1/' -e 's/:/ /g')

set -x VISUAL vim
set -x EDITOR $VISUAL
