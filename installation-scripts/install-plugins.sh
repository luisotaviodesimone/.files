#!/usr/bin/bash

PLUGINS_DIR="$DOT_FILES_DIR/plugins"
mkdir -p "$PLUGINS_DIR"

repos=(
    "https://github.com/zsh-users/zsh-syntax-highlighting.git zsh-syntax-highlighting"
    "https://github.com/zsh-users/zsh-autosuggestions.git zsh-autosuggestions"
    "https://github.com/zdharma-continuum/fast-syntax-highlighting.git fast-syntax-highlighting"
)

for repo in "${repos[@]}"; do
    read -r url dest <<< "$repo"
    if [ ! -d "$PLUGINS_DIR/$dest" ]; then
        git clone "$url" "$PLUGINS_DIR/$dest"
    else
        echo -e "$RED $dest is already installed$RESET"
    fi
done

[ -f "$PLUGINS_DIR/z.sh" ] && echo -e "$RED z.sh is already installed$RESET" || wget -q -P "$PLUGINS_DIR" https://raw.githubusercontent.com/rupa/z/master/z.sh
[ -f "$PLUGINS_DIR/git.plugin.zsh" ] && echo -e "$RED git.plugin.zsh is already installed$RESET" || wget -q -P "$PLUGINS_DIR" https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/git/git.plugin.zsh
