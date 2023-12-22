#!/usr/bin/bash

mkdir -p $DOT_FILES_DIR/plugins/

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $DOT_FILES_DIR/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git $DOT_FILES_DIR/plugins/zsh-autosuggestions
wget -nc --directory-prefix $DOT_FILES_DIR/plugins/ https://raw.githubusercontent.com/rupa/z/master/z.sh

