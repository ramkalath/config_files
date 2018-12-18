# nvim installation instructions in arch linux

sudo pacman -S neovim git clang cmake yaourt xclip gdb curl --noconfirm
# yaourt -S powerline-fonts-git nerd-fonts-complete-mono-glyphs --noconfirm

mkdir $HOME/.config/nvim
git clone https://github.com/ramkalath/config_files $HOME/config_files

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sudo pip install neovim
pushd $HOME/.config/nvim/plugged
git clone https://github.com/Valloric/YouCompleteMe $HOME/.config/nvim/plugged/YouCompleteMe
pushd $HOME/.config/nvim/plugged/YouCompleteMe
git submodule update --init --recursive

# 'clang completer' is for the family of c
# 'cs completer' is for c#
python3 install.py --clang-completer --system-libclang --cs-completer

# must create a symlinks from config_files folder
ln -s $HOME/config_files/nvim/UltiSnips $HOME/.config/nvim/UltiSnips
ln -s $HOME/config_files/nvim/init.vim $HOME/.config/nvim/init.vim

#nvim $HOME/.config/nvim/init.vim

# dunno powerline fonts require something else
#git clone https://github.com/powerline/fonts $HOME/Downloads/powerline_fonts
#pushd $HOME/Downloads/powerline_fonts

#cp -rf $HOME/config_files/nvim/UltiSnips $HOME/.config/nvim/
