# Install CaskaydiaCove Nerd Font
# wget --directory-prefix /tmp https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/CascadiaCode.zip
# unzip CascadiaCode.zip -d /tmp
# mkdir -p $HOME/.local/share/fonts
# mv /tmp/CaskaydiaCoveNerdFont* $HOME/.local/share/fonts
#

if [[ ! -f $HOME/.local/share/fonts/FiraCodeNerdFont-Regular.ttf ]]; then
    echo -e "$GREEN FiraCode Nerd Font is not installed. Installing it now.$RESET"

    # Install FiraCode Nerd Font
    wget --directory-prefix /tmp https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraCode.zip
    unzip /tmp/FiraCode.zip -d /tmp
    mkdir -p $HOME/.local/share/fonts
    mv /tmp/FiraCodeNerdFont* $HOME/.local/share/fonts
    rm /tmp/FiraCode.zip
    fc-cache -fE

else
    echo -e "$RED FiraCode Nerd Font is already installed.$RESET"
fi

if [[ ! -f $HOME/.local/share/fonts/JetBrainsMonoNerdFont-Regular.ttf ]]; then
    echo -e "$GREEN JetBrainsNerdFont is not installed. Installing it now.$RESET"

    # Use jq and curl to download jetbrains mono latest release fonts
    curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest \
        | jq '.assets[] | select(.name=="JetBrainsMono.zip") | .browser_download_url' -r \
        | wget --directory-prefix /tmp -i -
    unzip /tmp/JetBrainsMono.zip -d /tmp/JetBrainsMono
    mkdir -p $HOME/.local/share/fonts
    mv /tmp/JetBrainsMono/JetBrainsMonoNerdFont-* $HOME/.local/share/fonts
    rm /tmp/JetBrainsMono*
    fc-cache -fE
else
    echo -e "$RED JetBrainsMonoNerdFont is already installed.$RESET"
fi

