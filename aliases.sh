# Configuration files shortcuts
alias zshconfig="nvim $HOME/.zshrc"
alias kittyconfig="nvim $HOME/.config/kitty/kitty.conf"
alias ssconfig="nvim $HOME/.config/starship/starship.toml"
alias alctyconfig="nvim $HOME/.config/alacritty/alacritty.toml"
alias tmuxconfig="nvim $HOME/.config/tmux/tmux.conf"

# CLI shortcuts
alias kubectl="kubecolor"
compdef kubecolor="kubectl"
alias k="kubectl"
alias vim="nvim"
alias t="TERM=xterm-256color tmux"
alias ss="starship"
alias tf="terraform"
alias explorer="explorer.exe"

# Tools shortcuts
alias apply="source $HOME/.zshrc"
alias copy="xclip -selection c"
alias clc="fc -ln -1 | copy"
alias instaK8s="k3d cluster create --servers 3 --agents 3 local-cluster && k3d kubeconfig get local-cluster | sed s/k3d-//g > ~/.kube/configs/local-cluster"
alias kitty-theme="kitty +kitten themes --reload-in=all"
# alias gb-clean="[[ -d .git ]] && git fetch -p && for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'); do git branch -D $branch; done || echo 'Não é um repositório'"

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

# Bat alias
alias cat="batcat -p -P"

copyk3s ()
{
  host=$1
  password=$2
  file_to_append_to=$3
  ssh $host "echo '$password' | sudo -S cat /etc/rancher/k3s/k3s.yaml" | tee -a $file_to_append_to
}
