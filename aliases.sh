# Configuration files shortcuts
alias zshconfig="nvim $HOME/.zshrc"
alias kittyconfig="nvim $HOME/.config/kitty/kitty.conf"
alias ssconfig="nvim $HOME/.config/starship/starship.toml"
alias alctyconfig="nvim $HOME/.config/alacritty/alacritty.toml"
alias tmuxconfig="nvim $HOME/.config/tmux/tmux.conf"
alias i3config="nvim $HOME/.config/i3/config"

# CLI shortcuts

if (which kubectl > /dev/null && [[ $SHELL == "/bin/zsh" ]] || [[ $SHELL == "/usr/bin/zsh" ]]); then
    alias kubectl="kubecolor"
    compdef kubecolor="kubectl"
fi

# Tools shortcuts
alias k="kubectl"
alias vim="nvim"
alias t="TERM=xterm-256color tmux"
alias ss="starship"
alias tf="terraform"
alias explorer="explorer.exe"

alias apply="exec $SHELL"
alias copy="xclip -selection c"
alias clc="fc -ln -1 | copy"
alias instaK8s="k3d cluster create --servers 1 --agents 2 local-cluster && k3d kubeconfig get local-cluster | sed s/k3d-//g > ~/.kube/configs/local-cluster"
alias kitty-theme="kitty +kitten themes --reload-in=all"
alias a=". ./.venv/bin/activate"
alias d="deactivate"
# alias gb-clean="[[ -d .git ]] && git fetch -p && for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'); do git branch -D $branch; done || echo 'Não é um repositório'"
alias wgu="wg-quick up vpn"

# Kubectl shortcuts
# alias kok="kubectl get pods --all-namespaces -o wide | awk -F " *|/" '($3!=$4 || $5!="Running") && $5!="Completed" {print $0}'"
alias k-get-all="kubectl api-resources --verbs=list --namespaced -o name | xargs -n 1 kubectl get --show-kind --ignore-not-found"
alias kc="kubectl config use-context"
alias kn="kubectl config set-context --current --namespace"

# Docker shortcuts
alias dcu="docker context use"

# Git Aliases
alias gst="git status"

# Directory Aliases
alias ..="cd .."
alias ls="exa --color=auto"
alias l="ls -1"
alias ll="ls -l"
alias la="ls -1a"
alias lla="ls -la"

# Bat alias with fallback in case batcat is called only bat

command -v batcat > /dev/null && CMD=batcat || CMD=bat && alias cat="$CMD -p -P"
unset CMD

copyk3s ()
{
    host=$1
    password=$2
    file_to_append_to=$3
    cluster_name=$4
    ssh $host "echo '$password' | sudo -S cat /etc/rancher/k3s/k3s.yaml" | tee $file_to_append_to
    sed -i "s|default|$cluster_name|g" $file_to_append_to
    node_ip=$(echo -n $host | grep -oP "(?<=@).*")
    sed -i "s|127.0.0.1|$node_ip|g" $file_to_append_to
}

topodsbynode ()
{
    NODE_NAME="$1"
    echo "Getting metric from pods running on node $NODE_NAME..."
    kubectl get pods -A -o wide --no-headers | grep "$NODE_NAME" | awk '{print $1, $2}' | xargs -I{} $SHELL -c 'ns=$(echo {} | cut -d" " -f1); pod=$(echo {} | cut -d" " -f2); kubectl top pod --no-headers "$pod" -n "$ns"' | column -t -N NAME,CPU,MEMORY | awk '{print $3, $2, $1}' | sort -h | column -t
}

slugify ()
{
    echo "$1" | iconv -t ascii//TRANSLIT | sed -E -e 's/[^[:alnum:]]+/-/g' -e 's/^-+|-+$//g' | tr '[:upper:]' '[:lower:]'
}
