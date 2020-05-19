#!/bin/bash
# comment out needed lines for apt based or pacman based systems 
# this compiles a fork of i3-gaps with rounded window corners (https://github.com/resloved/i3.git)

# pacman
sudo pacman -Syy && sudo pacman -Syu

# pacman dependencies on arch 
sudo pacman -S --needed clang git wget curl zip unzip libev startup-notification xcb-util-cursor xcb-util-keysyms xcb-util-wm xcb-util-xrm libxkbcommon-x11 yajl cairo pango

# build doesnt work with gcc
export CC=/usr/bin/clang
export CXX=/usr/bin/clang++

cd /tmp

# clone the repository
git clone https://github.com/resloved/i3.git
cd i3

# compile & install
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/

# disabling sanitizers is important for release versions
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install

echo "Remember to install polybar"
