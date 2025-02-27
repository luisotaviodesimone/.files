#!/bin/bash

curl -L https://github.com/kubernetes/kompose/releases/download/v1.34.0/kompose-linux-amd64 -o kompose

chmod +x kompose
sudo mv ./kompose ~/.local/bin/kompose
