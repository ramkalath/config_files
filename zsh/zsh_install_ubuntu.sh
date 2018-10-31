sudo apt-get -y install zsh
pushd $HOME/
rm -rf $HOME/.oh-my-zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
rm $HOME/.zshrc
sudo ln -s $HOME/config_files/zsh/.zshrc $HOME/.zshrc
pushd $HOME/.oh-my-zsh/themes
wget https://raw.githubusercontent.com/jimeh/plain.zsh-theme/master/plain.zsh-theme $HOME/.oh-my-zsh/themes
pushd $HOME/
chsh -s `/bin/zsh`
