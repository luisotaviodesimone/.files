#!/usr/bin/bash

export DOT_FILES_DIR="$(dirname "$(readlink -f "$0")")"

source $DOT_FILES_DIR/utils.sh

YELLOW='\033[1;33m'
RED='\033[0;31m'
RESET='\033[0;0m'

apt_installed_apps="$(sudo apt list | awk -F '/' '{ print $1 }')"

apt_apps=(
    zsh
    golang
    libasound2-dev # Necessary for some sound golang packages
    libudev-dev    # Necessary for some sound golang packages
    ranger
    httpie
    neofetch
    resolvconf
    wireguard
    net-tools
    dnsutils
    btop
    tldr
)

for app in "${apt_apps[@]}"; do
    if [[ $(printf "%s\n" "$apt_installed_apps" | grep -x "$app") ]]; then
        echo -e "$RED $app is already installed$RESET"
        continue
    fi
    echo -e "$YELLOW Installing $app...$RESET"
    sudo apt install "$app" -y
done

### Install `nvm`
if ! isCommandInstalled "nvm"; then
echo -e "$YELLOW Installing nvm...$RESET"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
fi

### Add modularized installation scripts
modularized_installs=(
    neovim
    gh
    oh-my-zsh
    kitty
    lods
    helm
    kubectl
    docker
    code
    google-chrome-stable
)

for app in "${modularized_installs[@]}"; do

    if isCommandInstalled "$app"; then
        echo -e "$RED $app is already installed$RESET"
        continue
    fi
    echo -e "$YELLOW Installing $app...$RESET"
    . $DOT_FILES_DIR/installation-scripts/install-$app.sh
done

### Add modularized general configurations scripts

modularized_configs=(
    ssh
    config-files
)

for app in "${modularized_configs[@]}"; do
    echo -e "$YELLOW Configuring $app...$RESET"
    . $DOT_FILES_DIR/configs/config-$app.sh
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
