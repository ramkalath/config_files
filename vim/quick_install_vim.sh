#!/bin/bash
sudo apt-get install vim vim-athena xclip curl git
mkdir ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
wget https://raw.githubusercontent.com/ramkalath/config_files/master/vim/init_quick_deploy.vim
mv init_quick_deploy.vim .vimrc
