#!/usr/bin/bash

sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo apt update 
sudo apt install google-chrome-stable 
