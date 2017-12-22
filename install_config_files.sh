# This install script will install all the script files and setup the entire environment properly

# nvim installation
pushd $HOME/config_files/nvim/
./install_neovim.sh

# install tmux
pushd $HOME/config_files/tmux/
./install_tmux.sh

# install zsh
pushd $HOME/config_files/zsh/
./install_zsh.sh
