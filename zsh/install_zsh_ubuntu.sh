#!/bin/bash
sudo apt-get -y install zsh
pushd $HOME/
cp -rf $HOME/config_files/zsh/.oh-my-zsh $HOME/
rm $HOME/.zshrc
sudo ln -s $HOME/config_files/zsh/.zshrc .
chsh -s /bin/zsh
