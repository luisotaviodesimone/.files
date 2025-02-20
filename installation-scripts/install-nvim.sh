curl -LO https://github.com/neovim/neovim-releases/releases/download/v0.10.4/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
mkdir -p $HOME/.local/bin
mv nvim-linux-x86_64.appimage $HOME/.local/bin/nvim
sudo ln -sf $HOME/.local/bin/nvim /bin/nvim
