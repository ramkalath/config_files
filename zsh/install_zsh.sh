# Amme Sharanam

sudo pacman -S zsh tmux wget fzf
pushd $HOME/
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s /bin/zsh
cp $HOME/config_files/zsh/.zshrc $HOME/
cp $HOME/config_files/tmux/.tmux.conf $HOME/

# install fzf with oh-my-zsh
git clone https://github.com/junegunn/fzf.git ${ZSH}/custom/plugins/fzf
${ZSH}/custom/plugins/fzf/install --bin

git clone https://github.com/Treri/fzf-zsh.git ${ZSH}/custom/plugins/fzf-zsh

plugins=(... fzf-zsh ...)
