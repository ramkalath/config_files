# configuring basic vim-------------------------------------------------------------
# this has both python3 and clipboard support
cd /home/$USER/Downloads/
git clone https://github.com/vim/vim
cd vim/
./configure \
    --enable-perlinterp \
    --enable-python3interp \
    --enable-rubyinterp \
    --enable-cscope \
    --enable-gui=auto \
    --enable-gtk2-check \
    --enable-gnome-check \
    --with-features=huge \
    --enable-multibyte \
    --with-x \
    --with-compiledby="Senor QA <senor@qa>" \
    --with-python3-config-dir=/usr/lib/python3.3/config-3.3m-x86_64-linux-gnu
make
make install

# installing vundle----------------------------------------------------------------------
git clone https://github.com/VundleVim/Vundle.vim.git /home/$USER/.vim/bundle/Vundle.vim

# installing youcompleteme--------------------------------------------------------------
# make sure that clang is already installed
git clone https://github.com/Valloric/YouCompleteMe /home/$USER/.vim/bundle/
cd /home/$USER/.vim/bundle/YouCompleteMe/
git submodule update --init --recursive
python3 install.py --clang-completer --system-libclang
cd /home/$USER/

# Setting up Ultisnips ----------------------------------------------------------------
cd /home/$USER/config_files/vim/
cp -rf Ultisnips/ /home/$USER/.vim/
cd /home/$USER/


# Powerline fonts ---------------------------------------------------------------------
cd /home/$USER/Downloads
git clone https://github.com/powerline/fonts.git
cd fonts/
./install.sh
cd ..

# copy .vimrc into home folder --------------------------------------------------------
cp /home/$USER/config_files/vim/.vimrc /home/$USER/
