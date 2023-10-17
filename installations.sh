#!/usr/bin/bash

export DOT_FILES_DIR="$(dirname "$(readlink -f "$0")")"

YELLOW='\033[1;33m'
RESET='\033[0;0m'

apt_apps=(
    neovim
    zsh
    golang
    libasound2-dev # Necessary for some sound golang packages
    libudev-dev    # Necessary for some sound golang packages
    ranger
    httpie
    neofetch
    wireguard
    net-tools
    dnsutils
    btop
)

for app in "${apt_apps[@]}"; do
    echo -e "$YELLOW Installing $app...$RESET"
    sudo apt install "$app" -y
done

# Configure ranger
echo "set preview_images true" >>~/.config/ranger/rc.conf

### Install `nvm`
echo -e "$YELLOW Installing nvm...$RESET"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

### Add modularized installation scripts
modularized_installs=(
    gh
    oh-my-zsh
    kitty
    my-go-cli
    kubectl
    docker
    vscode
)

for app in "${modularized_installs[@]}"; do
    echo -e "$YELLOW Installing $app...$RESET"
    . $DOT_FILES_DIR/installation-scripts/install-$app.sh
done

### Prompt for flatpak installations

while true; do
    echo -n "Install flatpak apps? This will open another terminal window (y/n) "
    read answer

    case $answer in
    [Yy]*)
        x-terminal-emulator --hold --detach zsh -c ". $DOT_FILES_DIR/installation-scripts/install-flatpak-apps.sh"
        break
        ;;
    [Nn]*)
        echo "Finished all the setup"
        break
        ;;
    *) echo "Please answer yes or no." ;;
    esac
done

# . $DOT_FILES_DIR/installation-scripts/install-chrome.sh
