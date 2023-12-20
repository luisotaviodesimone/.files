#!/usr/bin/bash

# Set zsh as default shell
if [[ $SHELL == *"zsh"* ]]; then
    echo -e "$RED 'zsh' is already the default shell $RESET"
else
    echo "Setting zsh as default shell"
    sudo chsh -s $(which zsh) $USER
fi

curl -sS https://starship.rs/install.sh | sh -s -- -y

# Link .zshrc to home directory
ln -sf $DOT_FILES_DIR/.zshrc $HOME/.zshrc