export DOT_FILES_DIR="$(dirname "$(readlink -f "$0")")"
export KITTY_CONFIG_DIRECTORY="$DOT_FILES_DIR/kitty"
export NVM_DIR="$HOME/.nvm"
export PATH="$HOME/.platformio/penv/bin:/$HOME/.local/bin:/usr/local/go/bin:$HOME/go/bin:$HOME/.krew/bin:$PATH"
. $DOT_FILES_DIR/configs/config-kubectl.sh
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
export KUBE_EDITOR="/home/luisotaviodesimone/.local/bin/nvim"
export SDKMAN_DIR="$HOME/.sdkman"
export CPLUS_INCLUDE_PATH=/usr/include/c++/11:/usr/include/x86_64-linux-gnu/c++/11
export PYENV_ROOT="$HOME/.pyenv"

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/luisotaviodesimone/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<

[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Set environment vars in file
set -a && source $DOT_FILES_DIR/.env && set +a
