#!/usr/bin/bash

if [[ ! -f /usr/bin/yq ]]; then
  sudo wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq
  sudo chmod +x /usr/bin/yq
else
  echo -e "$RED\nThe 'yq' tool is already installed!$RESET"
fi
