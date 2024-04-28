# Configuration files shortcuts
alias zshconfig="vim $HOME/.zshrc"
alias kittyconfig="vim $HOME/.config/kitty/kitty.conf"
alias ssconfig="vim $HOME/.config/starship/starship.toml"

# CLI shortcuts
alias k="kubectl"
alias vim="nvim"
alias ss="starship"
alias tf="terraform"

# Tools shortcuts
alias apply="source $HOME/.zshrc"
alias copy="xclip -selection c"
alias clc="fc -ln -1 | copy"
alias instaK8s="k3d cluster create --servers 3 --agents 1 local-cluster && k3d kubeconfig get local-cluster | sed s/k3d-//g > ~/.kube/configs/local-cluster"

# Kubectl shortcuts
# alias kok="kubectl get pods --all-namespaces -o wide | awk -F " *|/" '($3!=$4 || $5!="Running") && $5!="Completed" {print $0}'"
alias k-get-all="kubectl api-resources --verbs=list --namespaced -o name | xargs -n 1 kubectl get --show-kind --ignore-not-found"
alias kc="kubectl config use-context"
alias kn="kubectl config set-context --current --namespace"

# Git Aliases
alias gst="git status"

# Directory Aliases
alias ..="cd .."
alias ls="ls --color=auto"
alias l="ls -l"
alias ll="ls -l"
alias la="ls -la"
