plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting z nvm kube-ps1)

# Allow autocompletion script loading
autoload -Uz compinit
compinit

# User aliases
. ~/.files/aliases.sh

# Environment variables
. ~/.files/env.sh

# Completion scripts
. ~/.files/completions.sh

