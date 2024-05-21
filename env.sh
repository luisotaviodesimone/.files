export DOT_FILES_DIR="$(dirname "$(readlink -f "$0")")"
export KITTY_CONFIG_DIRECTORY="$DOT_FILES_DIR/kitty"
export NVM_DIR="$HOME/.nvm"
export PATH="$HOME/.local/bin:/usr/local/go/bin:$PATH"
. $DOT_FILES_DIR/configs/config-kubectl.sh
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
export KUBE_EDITOR="/home/luisotaviodesimone/.local/bin/nvim"
export SDKMAN_DIR="$HOME/.sdkman"
