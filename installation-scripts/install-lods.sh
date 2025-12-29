#!/usr/bin/bash

myGoCliPath="$HOME/Documents/GitHub/my-go-cli"
binaryPath="$HOME/.local/bin/lods"

if [ -f "$binaryPath" ]; then
    echo "lods is already installed at $binaryPath"
else
    echo -e "${BLUE}Installing lods to $binaryPath${RESET}..."

    git clone https://github.com/luisotaviodesimone/my-go-cli.git "$myGoCliPath"

    mkdir -p "$HOME/.local/bin/"

    (
        cd "$myGoCliPath" || exit
        go build -o "$binaryPath" ./cmd/main.go
        cp --update=none sensible-info.example.json sensible-info.json
    )

    sed -i "s/personal-github-name-here/$USER/" "$myGoCliPath/sensible-info.json"
    sed -i "s/personal-github-email-here@email.com/$USER@gmail.com/" "$myGoCliPath/sensible-info.json"
fi
