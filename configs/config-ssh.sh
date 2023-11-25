#!/usr/bin/bash

# Use xterm as default shell in other hosts
if ! [[ $(grep -s "Setenv TERM=" "$HOME/.ssh/config") ]]; then
cat >> $HOME/.ssh/config <<- EOM

Host *
  Setenv TERM="xterm"
EOM
else
echo "Já existem configurações para o 'Host *'"
fi
