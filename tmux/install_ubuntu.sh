# remember to hit prefix+I to fetch the other plugins and install. tpm is simply a plugin manager for tmux

sudo apt-get install tmux
ln -s $HOME/config_files/tmux/.tmux.conf $HOME/.tmux.conf

mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
