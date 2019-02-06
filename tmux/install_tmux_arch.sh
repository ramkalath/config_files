#!/bin/bash
# install tmux

sudo pacman -S tmux --noconfirm
ln -s $HOME/config_files/tmux/.tmux.conf $HOME/.tmux.conf

mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
