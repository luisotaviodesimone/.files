#!/bin/bash

wget https://go.dev/dl/go1.22.2.linux-amd64.tar.gz

sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.22.2.linux-amd64.tar.gz

sudo apt install libasound2-dev libudev-dev -y

rm go1.22.2.linux-amd64.tar.gz
