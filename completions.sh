source <(kubectl completion zsh)
source <(helm completion zsh)
eval "$(starship init zsh)"
source <(starship completions zsh)
source <(k3d completion zsh)
source $DOT_FILES_DIR/utils.sh

# terraform
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

if isCommandInstalled "vagrant"; then
    fpath=(/opt/vagrant/embedded/gems/gems/vagrant-2.4.1/contrib/zsh $fpath)
    compinit
fi

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

