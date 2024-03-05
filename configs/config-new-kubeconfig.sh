#!/bin/bash

sed -i s/default/$1/g $HOME/.kube/configs/$1
sed -i s/127.0.0.1/$2/g $HOME/.kube/configs/$1 

