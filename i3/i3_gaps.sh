#!/bin/bash
sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev libtool automake

pushd $HOME/Downloads
git clone https://github.com/Airblader/xcb-util-xrm
pushd xcb-util-xrm
git submodule update --init
./autogen.sh --prefix=/usr
make
sudo make install
popd

git clone https://www.github.com/Airblader/i3 i3-gaps
pushd i3-gaps
git checkout gaps && git pull
autoreconf --force --install
rm -rf build
mkdir build
pushd build
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install
