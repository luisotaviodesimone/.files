#!/usr/bin/bash

export DOT_FILES_DIR="$(dirname "$(readlink -f "$0")")"

source $DOT_FILES_DIR/utils.sh
# Disable the alias script for now
# source $DOT_FILES_DIR/aliases.sh
source $DOT_FILES_DIR/env.sh

forceModularReinstall=$1

apt_apps=(
    bat
    brightnessctl
    btop
    build-essential
    dnsutils
    feh
    fuse
    fzf
    gcc
    gnome-shell-extension-gpaste
    gpaste
    httpie
    jq
    libbz2-dev
    libffi-dev
    libfuse2
    libncurses5-dev
    libnotify-bin
    libreadline-dev
    libsqlite3-dev
    libssl-dev
    libxml2-utils
    maim
    make
    mlocate
    neofetch
    net-tools
    polybar
    postgresql-client
    python3.10-venv
    ranger
    resolvconf
    ripgrep
    rofi
    sshpass
    tldr
    wireguard
    xautolock
    xclip
    zlib1g
    zlib1g-dev
    zsh
)

pacman_apps=(
    alacritty
    bat
    bind
    brightnessctl
    btop
    bluez
    bluez-utils
    bluetui
    dbeaver
    discord
    docker
    dunst
    feh
    firefox
    fuse3
    github-cli
    helm
    i3
    jq
    kubectl
    libnotify
    libqalculate
    lib32-systemd
    maim
    neofetch
    net-tools
    neovim
    nmap
    noto-fonts
    ntfs-3g
    picom
    polybar
    python-setuptools
    python-pipx
    ripgrep
    rofi
    sshpass
    systemd-resolvconf
    terminus-font
    tmux
    ttf-dejavu
    ttf-droid
    ttf-firacode-nerd
    ttf-freefont
    ttf-jetbrains-mono-nerd
    ttf-liberation
    ttf-roboto
    ttf-ubuntu-font-family
    wget
    wireguard-tools
    wireless_tools
    xautolock
    xclip
    xorg-apps
    xorg-server
    xorg-xinit
    zip
    zsh
)

sudo gpasswd -a luisotaviodesimone video

# Verify if is wsl
if [[ -f "/proc/sys/fs/binfmt_misc/WSLInterop" ]]; then
    sudo add-apt-repository ppa:wslutilities/wslu
    sudo apt update
    sudo apt install wslu
fi

. /etc/os-release

if [[ $ID == arch ]]; then

    for app in "${pacman_apps[@]}"; do
        echo -e "$YELLOW Installing $app...$RESET"
        sudo pacman -S --noconfirm "$app"
    done

elif [[ $ID == debian || $ID == pop || $ID == ubuntu || $ID_LIKE == debian || $ID_LIKE == ubuntu ]]; then
    apt_installed_apps="$(sudo apt list --installed | awk -F '/' '{ print $1 }')"

    for app in "${apt_apps[@]}"; do
        if [[ $(printf "%s\n" "$apt_installed_apps" | grep -x "$app") ]]; then
            echo -e "$RED $app is already installed$RESET"
            continue
        fi
        echo -e "$YELLOW Installing $app...$RESET"
        sudo apt install "$app" -y
    done

fi


# Activate gnome-gpaste-extension
gnome-extensions enable GPaste@gnome-shell-extensions.gnome.org

### Add modularized installation scripts
os_agnostic_installs=(
    starship
    plugins
    lods
    sdkman
    k3d
    autocompletes
    greenclip
)

modularized_installs=(
    nvim
    gh
    fonts
    kitty
    go
    node
    virtualbox
    tmux
    vagrant
    helm
    kubectl
    docker
    ansible
    pyenv
    terraform
    picom
    code
    alacritty
    google-chrome-stable
    mssql-sqlcmd
)


if [[ $ID == debian || $ID == pop || $ID == ubuntu || $ID_LIKE == debian || $ID_LIKE == ubuntu ]]; then

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
fi

for app in "${os_agnostic_installs[@]}"; do

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
    keyboard
    git
    zsh
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
