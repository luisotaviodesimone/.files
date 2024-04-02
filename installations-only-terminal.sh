#!/usr/bin/bash

sudo echo "Starting installation..."

apt_apps=(
    zsh
    golang
    httpie
    resolvconf
    fuse
    wireguard
    net-tools
    dnsutils
    tldr
    xclip
    fzf
    sshpass
)

for app in "${apt_apps[@]}"; do
    if [[ $(printf "%s\n" "$apt_installed_apps" | grep -x "$app") ]]; then
        echo -e "$RED $app is already installed$RESET"
        continue
    fi
    echo -e "$YELLOW Installing $app...$RESET"
    sudo apt install "$app" -y
done

export DOT_FILES_DIR="$(dirname "$(readlink -f "$0")")"

modularized_installs=(
    nvim
    gh
    starship
    plugins
    node
    lods
    helm
    kubectl
    docker
    ansible
    k3d
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

modularized_configs=(
    config-files
)

for app in "${modularized_configs[@]}"; do
    echo -e "$YELLOW Configuring $app...$RESET"
    . $DOT_FILES_DIR/configs/config-$app.sh
done
