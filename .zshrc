# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="philips"

COMPLETION_WAITING_DOTS="true"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting z nvm kube-ps1)

# User aliases
. ~/.files/aliases.sh

# Environment variables
. ~/.files/env.sh

# Completion scripts
. ~/.files/completions.sh

