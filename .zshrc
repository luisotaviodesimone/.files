fpath=(~/.docker/completions \\$fpath)
fpath=(~/.local/completions \\$fpath)
fpath+=${ZDOTDIR:-~}/.zsh_functions

# Allow autocompletion script loading
autoload -Uz compinit && compinit -i

# Fix weird alacritty things for now
# https://unix.stackexchange.com/questions/12107/how-to-unfreeze-after-accidentally-pressing-ctrl-s-in-a-terminal
stty -ixon

setopt sharehistory
setopt appendhistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
HISTFILE=$HOME/.zhistory
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase

# Enable case insensitive matches if there are no case sensitive matches
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "$key[Up]" history-beginning-search-backward
bindkey "$key[Down]" history-beginning-search-forward
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward

# Environment variables
. ~/.files/env.sh

# Completion scripts
. ~/.files/completions.sh

# Load starship command prompt
eval "$(starship init zsh)"

# User aliases
. ~/.files/aliases.sh

# Plugings sourcing
. ~/.files/plugins.sh

# (cd $DOT_FILES_DIR && git pull --quiet &)
# (cd $HOME/Documents/GitHub/my-go-cli && git pull --quiet &)
# (cd $HOME/Documents/GitLab/kube-config-files && git pull --quiet &)
