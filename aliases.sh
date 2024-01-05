# Configuration files shortcuts
alias zshconfig="vim $HOME/.zshrc"
alias kittyconfig="vim $HOME/.config/kitty/kitty.conf"
alias ssconfig="vim $HOME/.config/starship/starship.toml"

# CLI shortcuts
alias lods="$HOME/Documents/GitHub/my-go-cli/main"
alias k="kubectl"
alias vim="nvim"
alias ss="starship"

# Tools shortcuts
alias apply="source $HOME/.zshrc"
alias copy="xclip -selection c"
alias k-get-all="kubectl api-resources --verbs=list --namespaced -o name | xargs -n 1 kubectl get --show-kind --ignore-not-found"
alias kc="kubectl config use-context"
alias kn="kubectl config set-context --current --namespace"

# Git Aliases
alias gst="git status"

# Directory Aliases
alias ..="cd .."
alias ls="ls --color=auto"
alias ll="ls -l"
alias la="ls -la"
