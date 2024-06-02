#!/usr/bin/bash

# Install rofi with apt
sudo apt install rofi

git clone git@github.com:svenstaro/rofi-calc.git
cd rofi-calc/
mkdir m4
autoreconf -i
mkdir build
cd build/
../configure
sudo make install
sudo libtool --finish /usr/lib/x86_64-linux-gnu/rofi/
cd ../..
sudo rm -r rofi-calc
