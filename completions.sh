source <(kubectl completion zsh)
source <(helm completion zsh)
eval "$(starship init zsh)"
source <(starship completions zsh)

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
