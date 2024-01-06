# Allow autocompletion script loading
autoload -Uz compinit && compinit

setopt SHARE_HISTORY
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST

# Enable case insensitive matches if there are no case sensitive matches
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

bindkey "$key[Up]" history-search-backward
bindkey "$key[Down]" history-search-forward

# Environment variables
. ~/.files/env.sh

# User aliases
. ~/.files/aliases.sh

# Completion scripts
. ~/.files/completions.sh

# Plugings sourcing
. ~/.files/plugins.sh
