#!/bin/bash

# on ubuntu
sudo apt-get -y install rxvt-unicode-256color wmctrl fonts-inconsolata

# to enable fullscreen for all other gui environments other than i3wm
mkdir -p ~/.urxvt/ext/
cp ~/config_files/urxvt/fullscreen ~/.urxvt/ext/

# to set some changes after configuration modification
pushd $HOME/
ln -s ~/config_files/urxvt/.Xresources $HOME/.Xresources 
xrdb ~/.Xresources

