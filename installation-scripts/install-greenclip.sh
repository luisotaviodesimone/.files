#!/usr/bin/bash

wget https://github.com/erebe/greenclip/releases/download/v4.2/greenclip

sudo chmod 777 ./greenclip

mkdir -p $HOME/Pictures/Screenshots/
mv ./greenclip /usr/bin/
