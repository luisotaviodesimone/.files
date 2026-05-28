#!/usr/bin/bash

sudo echo "Starting installation..."
forceModularReinstall=$1

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
elif [[ ! -d "$HOME/.files" ]]; then
    echo -e "$YELLOW .files directory not found and no PAT provided. Cloning without recursive submodules.$RESET"
    git clone "https://github.com/luisotaviodesimone/.files.git" "$HOME/.files"
else
    echo -e "$GREEN .files directory already exists. Skipping clone.$RESET"
fi

cd "$HOME/.files" || exit
source ./utils.sh

export DOT_FILES_DIR="$HOME/.files"

apt_apps=(
    bat
    build-essential
    dnsutils
    eza
    fuse
    httpie
    jq
    libbz2-dev
    libffi-dev
    libfuse2t64
    libncurses-dev
    libreadline-dev
    libsqlite3-dev
    libssl-dev
    libxml2-utils
    net-tools
    nfs-common
    postgresql-client
    pkg-config
    python3.12-venv
    ripgrep
    sshpass
    tldr
    unzip
    xclip
    wireguard
    zip
    zlib1g
    zlib1g-dev
    zsh
)

apps_to_install=()
apt_installed_apps=$(dpkg-query -W -f='${Package}\n' 2>/dev/null)

if [[ -f "/proc/sys/fs/binfmt_misc/WSLInterop" ]] && echo "$apt_installed_apps" | grep -qx "$app"; then
    sudo add-apt-repository ppa:wslutilities/wslu
    sudo apt update
    sudo apt install wslu -y
fi

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
    echo -e "$GREEN All 'apt' packages are already up to date.$RESET"
fi

modularized_installs=(
    nvim
    tmux
    gh
    starship
    plugins
    go
    lods
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
    echo -e "$BLUE \bConfiguring $app...$RESET"
    . $DOT_FILES_DIR/configs/config-$app.sh
done

export PATH="$HOME/.local/bin:$PATH"
eval "$(mise activate bash)"
mise trust
mise install -y

echo -e "$BLUE \bFinalizing Mise installation...$RESET"
export PATH="$HOME/.local/share/mise/bin:$HOME/.local/bin:$PATH"

if isCommandInstalled "mise"; then
    mise trust
    mise install -y
else
    echo "$YELLOW \bMise binary not found. Check install-mise.sh$RESET"
fi
