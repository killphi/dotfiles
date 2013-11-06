# .bash_functions

cw(){ for i in {1..2000}; do echo; done; history -c; clear; }
script_source(){ ( cd `dirname ${BASH_SOURCE[1]}` && pwd -P ) }
