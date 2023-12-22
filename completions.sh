source <(kubectl completion zsh)
source <(helm completion zsh)
eval "$(starship init zsh)"
source <(starship completions zsh)

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Plugings sourcing
source $DOT_FILES_DIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $DOT_FILES_DIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $DOT_FILES_DIR/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $DOT_FILES_DIR/plugins/z.sh
source $DOT_FILES_DIR/plugins/git.plugin.zsh
