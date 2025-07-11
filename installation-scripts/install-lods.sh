#!/usr/bin/bash

myGoCliPath=$HOME/Documents/GitHub/my-go-cli

git clone https://github.com/luisotaviodesimone/my-go-cli.git $myGoCliPath

BLUE='\033[0;34m'
CLEAR='\033[0m'
echo -e "${BLUE}[INFO] Installing lods (luisotaviodesimone's Go CLI) to $HOME/.local/bin/lods${CLEAR}..."

sh -c "$(cd $myGoCliPath && mkdir -p $HOME/.local/bin/ && go build -o $HOME/.local/bin/lods ./cmd/main.go && cp $myGoCliPath/sensible-info.example.json sensible-info.json)" & wait

sed -i s/personal-github-name-here/$USER/ $myGoCliPath/sensible-info.json
sed -i s/personal-github-email-here@email.com/$USER@gmail.com/ $myGoCliPath/sensible-info.json
