# Allow autocompletion script loading
autoload -Uz compinit && compinit

# Enable case insensitive matches if there are no case sensitive matches
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# Enable history search with arrow keys
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "$key[Up]" history-beginning-search-backward-end
bindkey "$key[Down]" history-beginning-search-forward-end

# Environment variables
. ~/.files/env.sh

# User aliases
. ~/.files/aliases.sh

# Completion scripts
. ~/.files/completions.sh

# Plugings sourcing
. ~/.files/plugins.sh
