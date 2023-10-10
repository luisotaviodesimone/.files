#!/usr/bin/bash

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Please run as super user"
    return
fi

export DOT_FILES_DIR="$(dirname "$(readlink -f "$0")")"

YELLOW='\033[1;33m'
RESET='\033[0;0m'

### Apt Installations
echo "$YELLOW Installing neovim...$RESET"
sudo apt install neovim -y
echo "$YELLOW Installing zsh...$RESET"
sudo apt install zsh -y
echo "$YELLOW Installing gh...$RESET"
sudo apt install gh -y
echo "$YELLOW Installing golang...$RESET"
sudo apt install golang -y
sudo apt install libasound2-dev -y # Necessary for some sound golang packages
sudo apt install libudev-dev -y    # Necessary for some sound golang packages

echo "$YELLOW Installing ranger...$RESET"
sudo apt install ranger -y
echo "set preview_images true" >> ~/.config/ranger/rc.conf

### Install `nvm`
echo "$YELLOW Installing nvm...$RESET"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

### Add modularized installation scripts
echo "$YELLOW Installing oh-my-zsh...$RESET"
. $DOT_FILES_DIR/installation-scripts/install-oh-my-zsh.sh
echo "$YELLOW Installing kitty...$RESET"
. $DOT_FILES_DIR/installation-scripts/install-kitty.sh
echo "$YELLOW Installing my-go-cli...$RESET"
. $DOT_FILES_DIR/installation-scripts/install-my-go-cli.sh
echo "$YELLOW Installing vscode...$RESET"
. $DOT_FILES_DIR/installation-scripts/install-vscode.sh

### Prompt for flatpak installations

while true; do
    echo -n "Install flatpak apps? This will open another terminal window (y/n) "
    read answer

    case $answer in
        [Yy]* ) x-terminal-emulator --hold --detach zsh -c ". $DOT_FILES_DIR/installation-scripts/install-flatpak-apps.sh"; break;;
        [Nn]* ) echo "Finished all the setup"; break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# . $DOT_FILES_DIR/installation-scripts/install-chrome.sh
