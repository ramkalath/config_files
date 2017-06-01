cd ../Downloads/
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
