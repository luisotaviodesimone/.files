#!/usr/bin/bash

myGoCliPath=$HOME/Documents/GitHub/my-go-cli

git clone https://github.com/luisotaviodesimone/my-go-cli.git $myGoCliPath

sh -c "$(cd $myGoCliPath && go build -o main ./cmd/main.go)" & wait