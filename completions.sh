source $DOT_FILES_DIR/utils.sh
autoload -U +X bashcompinit && bashcompinit

# terraform
complete -o nospace -C /usr/bin/terraform terraform

if isCommandInstalled "vagrant"; then
    complete -o nospace -C /usr/bin/vagrant vagrant
fi

# NVM Cli
if ! isCommandInstalled "nvm"; then
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi


# SDK Man CLI
if ! isCommandInstalled "sdk"; then
    [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

