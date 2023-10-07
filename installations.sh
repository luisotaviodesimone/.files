#!/usr/bin/sh

export DOT_FILES_DIR="$(dirname "$(readlink -f "$0")")"

### Apt Installations
sudo apt install neovim -y
sudo apt install zsh -y
sudo apt install gh -y
sudo apt install golang -y
sudo apt install libasound2-dev -y # Necessary for some sound golang packages
sudo apt install libudev-dev -y    # Necessary for some sound golang packages

sudo apt install ranger -y
echo "set preview_images true" >> ~/.config/ranger/rc.conf

### Install `nvm`
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

### Add modularized and personal installation scripts
. $DOT_FILES_DIR/installation-scripts/install-oh-my-zsh.sh
. $DOT_FILES_DIR/installation-scripts/install-kitty.sh

### Substitute for flatpak installations
. $DOT_FILES_DIR/installation-scripts/install-vscode.sh
. $DOT_FILES_DIR/installation-scripts/install-chrome.sh
