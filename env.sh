export DOT_FILES_DIR="$(dirname "$(readlink -f "$0")")"
export KITTY_CONFIG_DIRECTORY="$DOT_FILES_DIR/kitty"
. $DOT_FILES_DIR/configs/config-kubectl.sh
