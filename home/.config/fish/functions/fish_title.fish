function fish_title
  if not set -q __fish_title_home
    set -g __fish_title_home (echo $HOME | sed 's/\\//\\\\\\//g')
  end

  set -l __fish_title (pwd | sed "s/^$__fish_title_home/~/")

  tmux rename-window $__fish_title:$_
end
