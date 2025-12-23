#!/usr/bin/bash

# Check if zsh is installed and is set to default shell

if (which zsh > /dev/null); then
    if [[ $SHELL == *"zsh"* ]]; then
        echo -e "$RED 'zsh' is already the default shell $RESET"
    else
        echo -e "$GREEN\bSetting zsh as default shell"
        sudo chsh -s /bin/zsh $USER
    fi

    if (which starship > /dev/null); then
        echo -e "$RED 'starship' is already installed"
    else
        curl -sS https://starship.rs/install.sh | sudo sh -s -- -y
    fi
else
    echo -e "$RED 'zsh' is not installed $RESET"
fi
