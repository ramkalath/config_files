# Amme Sharanam

sudo pacman -S zsh tmux wget fzf --noconfirm
pushd $HOME/
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
sudo chsh -s /bin/zsh
sudo ln -s $HOME/config_files/zsh/.zshrc $HOME/.zshrc

# install fzf with oh-my-zsh
git clone https://github.com/junegunn/fzf.git ${ZSH}/custom/plugins/fzf
<<<<<<< HEAD
sudo ${ZSH}/custom/plugins/fzf/install --bin
=======
pushd ${ZSH}/custom/plugins/fzf/
sudo ./install --bin
>>>>>>> a0d1d3d7f797451a1f44e1b71dfb9c926b46f0c9

git clone https://github.com/Treri/fzf-zsh.git ${ZSH}/custom/plugins/fzf-zsh

echo "plugins=(... fzf-zsh ...)" >> $(HOME)/config_files/zsh/.zshrc
