# Allow autocompletion script loading
autoload -Uz compinit && compinit -i

setopt SHARE_HISTORY
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST

# Enable case insensitive matches if there are no case sensitive matches
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "$key[Up]" history-beginning-search-backward
bindkey "$key[Down]" history-beginning-search-forward

# Environment variables
. ~/.files/env.sh

# User aliases
. ~/.files/aliases.sh

# Completion scripts
. ~/.files/completions.sh

# Plugings sourcing
. ~/.files/plugins.sh

# (cd $DOT_FILES_DIR && git pull --quiet &)
# (cd $HOME/Documents/GitHub/my-go-cli && git pull --quiet &)
# (cd $HOME/Documents/GitLab/kube-config-files && git pull --quiet &)
