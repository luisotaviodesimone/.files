### Apt Installations
sudo apt install neovim -y
sudo apt install zsh -y
sudo apt install gh -y
sudo apt install golang -y
sudo apt install libasound2-dev -y # Necessary for some sound golang packages
sudo apt install libudev-dev -y    # Necessary for some sound golang packages

### Install Oh-My-Zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
ln .zshrc ~/.zshrc --force

### Install oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

### Install `nvm`
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

### Add modularized and personal installation scripts
. ./install-vscode.sh
. ./install-chrome.sh
. ./install-kitty.sh
