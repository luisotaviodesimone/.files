source <(kubectl completion zsh)
source <(helm completion zsh)
eval "$(starship init zsh)"
source <(starship completions zsh)
source $DOT_FILES_DIR/utils.sh

if isCommandInstalled "vagrant"; then
    # >>>> Vagrant command completion (start)
    fpath=(/opt/vagrant/embedded/gems/gems/vagrant-2.4.1/contrib/zsh $fpath)
    compinit
    # <<<<  Vagrant command completion (end)
fi

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

