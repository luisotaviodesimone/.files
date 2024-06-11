# Install CaskaydiaCove Nerd Font
# wget --directory-prefix /tmp https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/CascadiaCode.zip
# unzip CascadiaCode.zip -d /tmp
# mkdir -p $HOME/.local/share/fonts
# mv /tmp/CaskaydiaCoveNerdFont* $HOME/.local/share/fonts

if [[ -f $HOME/.local/share/fonts/FiraCodeNerdFont-Regular.ttf ]]; then
    echo -e "$RED FiraCode Nerd Font is already installed$RESET"
    return
fi

# Install FiraCode Nerd Font
wget --directory-prefix /tmp https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraCode.zip 
unzip /tmp/FiraCode.zip -d /tmp
mkdir -p $HOME/.local/share/fonts
mv /tmp/FiraCodeNerdFont* $HOME/.local/share/fonts
rm /tmp/FiraCode.zip

fc-cache -fv

# Use jq and curl to download jetbrains mono latest release fonts
# curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest \
# | jq '.assets[] | select(.name=="JetBrainsMono.zip") | .browser_download_url' -r \
# | wget -i -
