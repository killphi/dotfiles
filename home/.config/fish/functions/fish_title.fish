function fish_title
  if not set -q __home_escaped
    set -g __home_escaped (echo $HOME | sed 's/\\//\\\\\\//g')
  end

  set -l title (pwd | sed -e "s/^$__home_escaped/~/" -e 's/.*\/\(.*\/.*\)$/\1/')

  tmux rename-window $title:$_
end
