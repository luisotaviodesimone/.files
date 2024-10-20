curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mkdir -p $HOME/.local/bin
mv nvim.appimage $HOME/.local/bin/nvim
sudo ln -sf $HOME/.local/bin/nvim /bin/nvim
