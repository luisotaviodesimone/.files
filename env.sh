export DOT_FILES_DIR="$(dirname "$(readlink -f "$0")")"
export KITTY_CONFIG_DIRECTORY="$DOT_FILES_DIR/kitty"
export NVM_DIR="$HOME/.nvm"
export PATH="$HOME/.local/bin:$PATH"
. $DOT_FILES_DIR/configs/config-kubectl.sh
