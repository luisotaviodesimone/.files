#!/usr/bin/bash

myGoCliPath=$HOME/Documents/GitHub/my-go-cli

git clone https://github.com/luisotaviodesimone/my-go-cli.git $myGoCliPath

sh -c "$(cd $myGoCliPath && go build -o $HOME/.local/bin/lods ./cmd/main.go && cp $myGoCliPath/sensible-info.example.json sensible-info.json)" & wait

sed -i s/personal-github-name-here/\$USER/ $myGoCliPath/sensible-info.json
sed -i s/personal-github-email-here@email.com/\$USER@gmail.com/ $myGoCliPath/sensible-info.json
