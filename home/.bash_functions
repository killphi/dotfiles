# .bash_functions

cw(){
  # go to home dir
  cd

  # reset rvm env
  rvm use default

  for i in {1..2000}; do
    echo
  done

  tmux clear-history

  # needs to be on same line
  history -c; clear
}
find_unclean_repos(){ find . -type d -name .git -execdir $HOME/.local/tools/unclean_repo.sh \;; }
