#sudo apt-get install zsh
#chsh -s `/bin/zsh`
pushd $HOME/
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
pushd $HOME/.oh-my-zsh/themes
wget https://raw.githubusercontent.com/jimeh/plain.zsh-theme/master/plain.zsh-theme $HOME/.oh-my-zsh/themes
pushd $HOME/
rm .zshrc
sudo ln -s $HOME/config_files/zsh/.zshrc $HOME/.zshrc
