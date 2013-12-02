# .bash_functions

cw(){ for i in {1..2000}; do echo; done; tmux clear-history; history -c; clear; }
script_source(){ ( cd `dirname ${BASH_SOURCE[1]}` && pwd -P ) }
