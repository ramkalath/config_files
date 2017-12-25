# Amme Sharanam

sudo pacman -S zsh tmux wget fzf --noconfirm
pushd $HOME/
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s /bin/zsh
ln -s $HOME/config_files/zsh/.zshrc $HOME/.zshrc

# install fzf with oh-my-zsh
git clone https://github.com/junegunn/fzf.git ${ZSH}/custom/plugins/fzf
pushd ${ZSH}/custom/plugins/fzf/
sudo ./install --bin

git clone https://github.com/Treri/fzf-zsh.git ${ZSH}/custom/plugins/fzf-zsh

echo "plugins=(... fzf-zsh ...)" >> $(HOME)/config_files/zsh/.zshrc
