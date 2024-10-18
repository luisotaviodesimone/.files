curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mv nvim.appimage $HOME/.local/bin/nvim
sudo ln -sf $HOME/.local/bin/nvim /bin/nvim
