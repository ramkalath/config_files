# nvim installation instructions in arch linux

sudo pacman -S neovim git clang cmake yaourt
yaourt -S powerline-fonts-git

mkdir $HOME/.config/nvim
git clone https://github.com/ramkalath/config_files $HOME/config_files
cp $HOME/config_files/nvim/init.vim /home/ram/.config/nvim/
cp $HOME/config_files/system_files/.bashrc $HOME/
cp $HOME/config_files/tmux/.tmux.conf $HOME/
cp $HOME/config_files/zsh/.zshrc $HOME/
cp $HOME/config_files/system_files/.yaourtrc $HOME/

git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.config/nvim/bundle/Vundle.vim

sudo pip install neovim
pushd $HOME/.config/nvim/bundle
git clone https://github.com/Valloric/YouCompleteMe $HOME/.config/nvim/bundle/YouCompleteMe
pushd $HOME/.config/nvim/bundle/YouCompleteMe
git submodule update --init --recursive
python install.py --clang-completer --system-libclang

nvim $HOME/.config/nvim/init.vim
