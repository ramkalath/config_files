# configuring basic vim-------------------------------------------------------------
# this has both python3 and clipboard support
pushd /home/$USER/Downloads/ > /dev/null
echo $PWD
git clone https://github.com/vim/vim
pushd vim/ > /dev/null
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
sudo make install

# installing vundle----------------------------------------------------------------------
git clone https://github.com/VundleVim/Vundle.vim.git /home/$USER/.vim/bundle/Vundle.vim

# installing youcompleteme--------------------------------------------------------------
# make sure that clang is already installed
git clone https://github.com/Valloric/YouCompleteMe /home/$USER/.vim/bundle/YouCompleteMe/
pushd /home/$USER/.vim/bundle/YouCompleteMe/ > /dev/null
echo $PWD
git submodule update --init --recursive
python3 install.py --clang-completer --system-libclang
git clone https://github.com/rdnetto/YCM-Generator

# Setting up Ultisnips ----------------------------------------------------------------
cp -rf /home/$USER/config_files/vim/UltiSnips/ /home/$USER/.vim/

# Powerline fonts ---------------------------------------------------------------------
pushd /home/$USER/Downloads > /dev/null
echo $PWD
git clone https://github.com/powerline/fonts.git
pushd /home/$USER/Downloads/fonts
echo $PWD
./install.sh

# copy .vimrc into home folder --------------------------------------------------------
cp /home/$USER/config_files/vim/.vimrc /home/$USER/
