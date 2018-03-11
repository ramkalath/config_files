# Amme Sharanam!
# configuring basic vim-------------------------------------------------------------
# this has both python3 and clipboard support
# dependences installation--------------------------
sudo pacman -S git clang cmake yaourt xclip gdb curl --noconfirm
yaourt -S powerline-fonts-git --noconfirm

# cloning a copy of vim
git clone https://github.com/vim/vim $HOME/Downloads/vim

pushd $HOME/Downloads/vim
./configure \
--enable-multibyte \
--enable-perlinterp=dynamic \
--enable-rubyinterp=dynamic \
--with-ruby-command=/usr/bin/ruby \
--enable-pythoninterp=dynamic \
--with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
--enable-python3interp \
--with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
--enable-luainterp \
--with-luajit \
--enable-cscope \
--enable-gui=auto \
--with-features=huge \
--with-x \
--enable-fontset \
--enable-largefile \
--disable-netbeans \
--enable-fail-if-missing
make
sudo make install

# installing vundle-------------------------
pushd $HOME
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

# installing youcompleteme-----------------
# make sure that clang is already installed
git clone https://github.com/Valloric/YouCompleteMe $HOME/.vim/bundle/YouCompleteMe/
pushd $HOME/.vim/bundle/YouCompleteMe/
git submodule update --init --recursive
python3 install.py --clang-completer --system-libclang

# Powerline fonts ---------------------------------------------------------------------
git clone https://github.com/powerline/fonts.git $HOME/Downloads/powerline_fonts
pushd $HOME/Downloads/powerline_fonts
./install.sh

# copy .vimrc into home folder --------------------------------------------------------
cp $HOME/config_files/vim/.vimrc $HOME
cp -rf $HOME/config_files/nvim/UltiSnips $HOME/.vim
