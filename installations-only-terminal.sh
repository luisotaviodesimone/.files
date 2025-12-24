#!/usr/bin/bash

sudo echo "Starting installation..."

echo -ne "Would you like to use a Personal Access Token (PAT)? (y/N) "
read -r usePATResponse

unset GITHUB_PAT
if [[ "$usePATResponse" == "y" || "$usePATResponse" == "Y" ]]; then
    echo -ne "Please enter your GitHub Personal Access Token: "
    read -r GITHUB_PAT
    export GITHUB_PAT
fi

if [ ! -d "$HOME/.files" ] && [ -n "$GITHUB_PAT" ]; then
    echo -e "Cloning '.files' dir"
    git clone "https://$GITHUB_PAT@github.com/luisotaviodesimone/.files.git" "$HOME/.files" --recurse-submodules
    unset GITHUB_PAT
fi

cd "$HOME/.files" || exit
source ./env.sh

export DOT_FILES_DIR="$(dirname "$(readlink -f "$0")")"

apt_apps=(
    bat
    build-essential
    dnsutils
    eza
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
    python3.12-venv
    ripgrep
    sshpass
    tldr
    unzip
    xclip
    wireguard
    zlib1g
    zlib1g-dev
    zsh
)

apps_to_install=()

for app in "${apt_apps[@]}"; do
    if echo "$apt_installed_apps" | grep -qx "$app"; then
        echo -e "$RED $app is already installed$RESET"
    else
        apps_to_install+=("$app")
    fi
done

if [ ${#apps_to_install[@]} -gt 0 ]; then
    echo -e "$YELLOW Installing missing apps: ${apps_to_install[*]}$RESET"
    sudo apt update
    sudo apt install "${apps_to_install[@]}" -y
else
    echo -e "$GREEN All packages are already up to date.$RESET"
fi

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

source .zshrc

mise trust
mise install
