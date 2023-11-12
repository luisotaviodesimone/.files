alias lods="$HOME/Documents/GitHub/my-go-cli/main"
alias zshconfig="vim $HOME/.zshrc"
alias kittyconfig="vim $HOME/.config/kitty/kitty.conf"
alias apply="source $HOME/.zshrc"
alias vim="$HOME/.local/bin/nvim"
alias k=kubectl
alias copy="xclip -selection c"
alias k-get-all="kubectl api-resources --verbs=list --namespaced -o name | xargs -n 1 kubectl get --show-kind --ignore-not-found"