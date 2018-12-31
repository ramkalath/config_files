# nvim installation instructions in arch linux
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get -y update
sudo apt-get -y install neovim git clang cmake xclip gdb curl powerline python-pip python3-pip

mkdir $HOME/.config/nvim
git clone https://github.com/ramkalath/config_files $HOME/config_files

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sudo pip install neovim
sudo pip3 install neovim
cd $HOME/.config/nvim/plugged
git clone https://github.com/Valloric/YouCompleteMe $HOME/.config/nvim/plugged/YouCompleteMe
cd $HOME/.config/nvim/plugged/YouCompleteMe
git submodule update --init --recursive

# 'clang completer' is for the family of c. We can add more flags such as --cs-completer for c# etc,.
python3 install.py --clang-completer # this will download its own version of clang

# if the above gives an error then try using --system-libclang
# python3 install.py --clang-completer --system-libclang

# must create a symlinks from config_files folder (TODO: test this)
ln -s $HOME/config_files/nvim/init.vim $HOME/.config/nvim/init.vim

# dunno powerline fonts require something else
git clone https://github.com/powerline/fonts $HOME/Downloads/powerline_fonts
cd $HOME/Downloads/powerline_fonts

#cp -rf $HOME/config_files/nvim/UltiSnips $HOME/.config/nvim/
