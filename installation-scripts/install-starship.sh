#!/usr/bin/bash

# Check if zsh is installed and is set to default shell

if [[ -f /bin/zsh ]]; then
    if [[ $SHELL == *"zsh"* ]]; then
        echo -e "$RED 'zsh' is already the default shell $RESET"
    else
        echo -e "$GREEN Setting zsh as default shell"
        sudo chsh -s /bin/zsh $USER
    fi
else
    echo -e "$RED 'zsh' is not installed $RESET"
fi

if (which starship > /dev/null); then
    echo -e "$RED 'starship' is already installed"
else
    curl -sS https://starship.rs/install.sh | sh -s -- -y
fi


# Link .zshrc to home directory
if [[ ! -z $DOT_FILES_DIR ]]; then
    export DOT_FILES_DIR="$(dirname "$(readlink -f "$0")")"
fi

ln -sf $DOT_FILES_DIR/.zshrc $HOME/.zshrc
