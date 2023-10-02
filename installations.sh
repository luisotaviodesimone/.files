### Configure shell
sudo apt install neovim
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
. ./install-kitty.sh

ln .zshrc ~/.zshrc

# Install oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
###

### Install some dev tools
sudo apt install gh
sudo apt install golang
sudo apt install libasound2-dev
sudo apt install libudev-dev
. ./install-vscode.sh
# wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# sudo apt install google-chrome-stable_current_amd64.deb
