#!/usr/bin/bash

export DOT_FILES_DIR="$(dirname "$(readlink -f "$0")")"

source $DOT_FILES_DIR/utils.sh
source $DOT_FILES_DIR/aliases.sh
source $DOT_FILES_DIR/env.sh

forceModularReinstall=$1

apt_installed_apps="$(sudo apt list --installed | awk -F '/' '{ print $1 }')"

apt_apps=(
    zsh
    ranger
    httpie
    neofetch
    resolvconf
    wireguard
    net-tools
    postgresql-client
    dnsutils
    btop
    tldr
    xclip
    gpaste
    gnome-shell-extension-gpaste
    fzf
    sshpass
    ripgrep
)

for app in "${apt_apps[@]}"; do
    if [[ $(printf "%s\n" "$apt_installed_apps" | grep -x "$app") ]]; then
        echo -e "$RED $app is already installed$RESET"
        continue
    fi
    echo -e "$YELLOW Installing $app...$RESET"
    sudo apt install "$app" -y
done

# Activate gnome-gpaste-extension
gnome-extensions enable GPaste@gnome-shell-extensions.gnome.org

### Add modularized installation scripts
modularized_installs=(
    nvim
    gh
    starship
    plugins
    fonts
    kitty
    go
    node
    virtualbox
    vagrant
    lods
    helm
    kubectl
    yq
    docker
    ansible
    terraform
    k3d
    code
    google-chrome-stable
)

for app in "${modularized_installs[@]}"; do

    if [[ "$forceModularReinstall" != "--reinstall" ]]; then
        if isCommandInstalled "$app"; then
            echo -e "$RED $app is already installed$RESET"
            continue
        fi
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
        echo -e "$GREEN Configuração terminada! $RESET"
        break
        ;;
    *) echo -e "$RED Please answer yes or no. $RESET" ;;
    esac
done
