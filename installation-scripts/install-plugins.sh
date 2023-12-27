#!/usr/bin/bash

mkdir -p $DOT_FILES_DIR/plugins/

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $DOT_FILES_DIR/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git $DOT_FILES_DIR/plugins/zsh-autosuggestions
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git $DOT_FILES_DIR/plugins/fast-syntax-highlighting
wget -nc --directory-prefix $DOT_FILES_DIR/plugins/ https://raw.githubusercontent.com/rupa/z/master/z.sh
wget -nc --directory-prefix $DOT_FILES_DIR/plugins/ https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/git/git.plugin.zsh
wget -nc --directory-prefix $DOT_FILES_DIR/plugins/ https://raw.githubusercontent.com/zsh-users/zsh-history-substring-search/master/zsh-history-substring-search.zsh

