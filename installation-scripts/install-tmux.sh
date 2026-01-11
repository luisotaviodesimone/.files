#!/usr/bin/bash

if which apt >/dev/null; then 
  sudo apt install -y tmux
fi

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
