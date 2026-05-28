autoload -U +X bashcompinit && bashcompinit

if isCommandInstalled "terraform"; then
    complete -o nospace -C /usr/bin/terraform terraform
fi

if isCommandInstalled "vagrant"; then
    complete -o nospace -C /usr/bin/vagrant vagrant
fi

if isCommandInstalled "vault"; then
    complete -o nospace -C /usr/bin/vault vault
fi

if isCommandInstalled "tofu"; then
    complete -o nospace -C /usr/bin/tofu tofu
fi

if isCommandInstalled "mc"; then
    complete -o nospace -C /home/luisotaviodesimone/.local/bin/mc mc
fi

# NVM Cli
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Rust's Cargo
. "$HOME/.cargo/env"

# SDK Man CLI
if ! isCommandInstalled "sdk"; then
    [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

