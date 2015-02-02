#!/usr/bin/env bash

urxvt256c-ml -C -cd ~ -e tmux -2 attach -t standard &

while [[ -z `wmctrl -l | grep tmux` ]]
do
  sleep 0.1
done

wmctrl -r tmux -b add,fullscreen
