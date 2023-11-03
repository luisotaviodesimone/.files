#!/usr/bin/bash

# Use xterm as default shell in other hosts
if ! [[ $(grep -qs "Host *" "$HOME/.ssh/config") ]]; then
cat > $HOME/.ssh/config <<- EOM
Host *
  Setenv TERM="xterm"

EOM
else
echo "Já existem configurações para o 'Host *'"
fi
