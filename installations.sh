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
    mlocate
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
    rofi
    gnome-shell-extension-gpaste
    fzf
    brightnessctl
    maim
    bat
    polybar
    feh
    libnotify-bin
    xautolock
    sshpass
    ripgrep
    libxml2-utils
)

sudo gpasswd -a luisotaviodesimone video

# Verify if is wsl
if [[ -f "/proc/sys/fs/binfmt_misc/WSLInterop" ]]; then
  sudo add-apt-repository ppa:wslutilities/wslu
  sudo apt update
  sudo apt install wslu
fi

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
    tmux
    vagrant
    lods
    helm
    kubectl
    sdkman
    greenclip
    docker
    ansible
    pyenv
    terraform
    k3d
    picom
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
    keyboard
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
