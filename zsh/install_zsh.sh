# Amme Sharanam

sudo pacman -S zsh wget
pushd $HOME/
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s /bin/zsh
cp $HOME/config_files/zsh/.zshrc $HOME/

