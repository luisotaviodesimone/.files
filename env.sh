export KITTY_CONFIG_DIRECTORY="$HOME/.files/kitty"
export DOT_FILES_DIR="$(dirname "$(readlink -f "$0")")"
. $DOT_FILES_DIR/configs/config-kubectl.sh
