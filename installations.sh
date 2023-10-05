#!/usr/bin/sh

export DOT_FILES_DIR="$(dirname "$(readlink -f "$0")")"

### Apt Installations
sudo apt install neovim -y
sudo apt install zsh -y

sudo apt install ranger -y
echo "set preview_images true" >> ~/.config/ranger/rc.conf

sudo apt install gh -y
sudo apt install golang -y
sudo apt install libasound2-dev -y # Necessary for some sound golang packages
sudo apt install libudev-dev -y    # Necessary for some sound golang packages

### Install `nvm`
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

### Add modularized and personal installation scripts
. $DOT_FILES_DIR/install-oh-my-zsh.sh
. $DOT_FILES_DIR/install-vscode.sh
. $DOT_FILES_DIR/install-chrome.sh
. $DOT_FILES_DIR/install-kitty.sh
