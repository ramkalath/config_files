#!/bin/bash
sudo apt-get install vim
mkdir ~/.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
wget https://raw.githubusercontent.com/ramkalath/config_files/master/nvim/init_quick_deploy.vim
mv init_quick_deploy.vim .vimrc
