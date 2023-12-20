#!/usr/bin/bash

mkdir -p $HOME/.ssh

# Use xterm as default shell in other hosts
if ! [[ $(grep -s "Setenv TERM=" "$HOME/.ssh/config") ]]; then
cat >> $HOME/.ssh/config <<- EOM

Host *
  Setenv TERM="xterm"
EOM
else
echo -e "$RED Já existem configurações para o 'Host *' $RESET"
fi
