#!/usr/bin/bash

sudo echo "Starting installation..."

apt_apps=(
    bat
    build-essential
    dnsutils
    fuse
    fzf
    httpie
    jq
    libbz2-dev
    libffi-dev
    libfuse2
    libncurses5-dev
    libreadline-dev
    libsqlite3-dev
    libssl-dev
    libxml2-utils
    net-tools
    nfs-common
    postgresql-client
    python3.10-venv
    ripgrep
    sshpass
    tldr
    unzip
    xclip
    zlib1g
    zlib1g-dev
    zsh
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
    tmux
    gh
    starship
    plugins
    go
    node
    lods
    helm
    kubectl
    sdkman
    docker
    ansible
    terraform
    k3d
    autocompletes
    rust
    mise
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
    ssh
    git
    zsh
)

for app in "${modularized_configs[@]}"; do
    echo -e "$YELLOW Configuring $app...$RESET"
    . $DOT_FILES_DIR/configs/config-$app.sh
done
