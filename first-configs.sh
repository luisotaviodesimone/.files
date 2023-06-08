xcode-select --install || echo 'Xcode already installed!!!'

source .zshrc

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

source .zshrc

more ~/.files/.zshrc >> ~/.zshrc

source .zshrc

brew install gcc
brew install --cask google-chrome
brew install --cask insomnia
brew install --cask visual-studio-code
brew install --cask notion
brew install nvm
brew install neovim
brew install gh