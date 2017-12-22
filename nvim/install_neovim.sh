# nvim installation instructions in arch linux

sudo pacman -S neovim git clang cmake yaourt xclip
yaourt -S powerline-fonts-git

mkdir $HOME/.config/nvim
git clone https://github.com/ramkalath/config_files $HOME/config_files

git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.config/nvim/bundle/Vundle.vim

sudo pip install neovim
pushd $HOME/.config/nvim/bundle
git clone https://github.com/Valloric/YouCompleteMe $HOME/.config/nvim/bundle/YouCompleteMe
pushd $HOME/.config/nvim/bundle/YouCompleteMe
git submodule update --init --recursive
python install.py --clang-completer --system-libclang

# must create a symlinks from config_files folder
ln -s $HOME/config_files/nvim/UltiSnips $HOME/.config/nvim/UltiSnips
ln -s $HOME/config_files/nvim/init.vim $HOME/.config/nvim/init.vim

nvim $HOME/.config/nvim/init.vim

# dunno powerline fonts require something else
git clone https://github.com/powerline/fonts $HOME/Downloads/powerline_fonts
pushd $HOME/Downloads/powerline_fonts

