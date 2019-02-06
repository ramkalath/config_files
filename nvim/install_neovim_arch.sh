						# nvim installation instructions in arch linux
#!/bin/bash

sudo pacman -S neovim git clang cmake yaourt xclip gdb curl --noconfirm python2-pip python3-pip
sudo pip install neovim
sudo pip3 install neovim

# installing vimplug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# installing youcompleteme
pushd $HOME/.config/nvim/plugged
git clone https://github.com/Valloric/YouCompleteMe $HOME/.config/nvim/plugged/YouCompleteMe
pushd $HOME/.config/nvim/plugged/YouCompleteMe
git submodule update --init --recursive
# 'clang completer' is for the family of c. We can add more flags such as --cs-completer for c# etc,.
python3 install.py --clang-completer # this will download its own version of clang
# if the above gives an error then try using --system-libclang
# python3 install.py --clang-completer --system-libclang

# must create a symlinks from config_files folder
ln -s $HOME/config_files/nvim/init.vim $HOME/.config/nvim/init.vim
ln -s $HOME/config_files/nvim/UltiSnips $HOME/.config/nvim/UltiSnips
