#!/bin/env bash

curl --progress-bar -L https://dl.min.io/aistor/mc/release/linux-amd64/mc \
--create-dirs \
-o $HOME/minio-binaries/mc

chmod +x ~/minio-binaries/mc

~/minio-binaries/mc --help
