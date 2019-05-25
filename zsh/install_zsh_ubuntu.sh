#!/bin/bash

sudo apt-get -y install zsh
pushd $HOME/
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
rm $HOME/.zshrc
sudo ln -s $HOME/config_files/zsh/.zshrc $HOME/.zshrc
pushd $HOME/.oh-my-zsh/themes
wget https://raw.githubusercontent.com/jimeh/plain.zsh-theme/master/plain.zsh-theme $HOME/.oh-my-zsh/themes
pushd $HOME/
chsh -s /bin/zsh

# remember you have to logout and login again for zsh to take effect

# run this command again if this does not take effect
# chsh -s /bin/zsh

some nonsense here
