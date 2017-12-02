# Amme Sharanam

sudo pacman -S zsh tmux wget
pushd $HOME/
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s /bin/zsh
cp $HOME/config_files/zsh/.zshrc $HOME/
cp $HOME/config_files/tmux/.tmux.conf $HOME/
