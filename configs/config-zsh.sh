# Link .zshrc to home directory
if [[ -z $DOT_FILES_DIR ]]; then
    export DOT_FILES_DIR="$HOME/.files"
fi

ln -sf $DOT_FILES_DIR/.zshrc $HOME/.zshrc
