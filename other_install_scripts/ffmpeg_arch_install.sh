yaourt -S nasm yasm mercurial numactl lame doxygen

#install libx264 ------------------------------------------------------------------------
pushd $HOME/Downloads/ffmpeg_sources
git -C x264 pull 2> /dev/null || git clone --depth 1 https://git.videolan.org/git/x264
pushd x246
PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" --enable-static --enable-pic
PATH="$HOME/bin:$PATH" make
sudo make install

#install libx265 ------------------------------------------------------------------------
pushd $HOME/Downloads/ffmpeg_sources
hg clone https://bitbucket.org/multicoreware/x265
pushd x265/build/linux
PATH="$HOME/bin:$PATH" cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$HOME/ffmpeg_build" -DENABLE_SHARED=off ../../source
PATH="$HOME/bin:$PATH" make
sudo make install

# install libvpx ------------------------------------------------------------------------
pushd $HOME/Downloads/ffmpeg_sources/
git clone --depth 1 https://chromium.googlesource.com/webm/libvpx.git
pushd libvpx
PATH="$HOME/bin:$PATH" ./configure --prefix="$HOME/ffmpeg_build" --disable-examples --disable-unit-tests --enable-vp9-highbitdepth --as=yasm 
PATH="$HOME/bin:$PATH" make
sudo make install

# libfdk--aac ---------------------------------------------------------------------------
pushd $HOME/Downloads/ffmpeg_sources
git clone --depth 1 https://github.com/mstorsjo/fdk-aac
pushd fdk-aac
autoreconf -fiv
./configure --prefix="$HOME/ffmpeg_build" --disable-shared
make
sudo make install

# libopus -------------------------------------------------------------------------------
pushd $HOME/Downloads/ffmpeg_sources
git -C opus pull 2> /dev/null || git clone --depth 1 https://github.com/xiph/opus.git
cd opus
./autogen.sh
./configure --prefix="$HOME/ffmpeg_build" --disable-shared
make
sudo make install

# libaom --------------------------------------------------------------------------------
pushd $HOME/Downloads/ffmpeg_sources
git clone https://aomedia.googlesource.com/aom
pushd aom
mkdir aom_build
PATH="$HOME/bin:$PATH" cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$HOME/ffmpeg_build" -DENABLE_SHARED=off -DENABLE_NASM=on ..
PATH="$HOME/bin:$PATH" make

# ffmpeg -------------------------------------------------------------------------------
pushd $HOME/Downloads/ffmpeg_sources
wget -O ffmpeg-snapshot.tar.bz2 https://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2
tar -xvf ffmpeg-snapshot.tar.bz2
pushd ffmpeg/
PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure \
  --prefix="$HOME/ffmpeg_build" \
  --pkg-config-flags="--static" \
  --extra-cflags="-I$HOME/ffmpeg_build/include" \
  --extra-ldflags="-L$HOME/ffmpeg_build/lib" \
  --extra-libs="-lpthread -lm" \
  --bindir="$HOME/bin" \
  --enable-gpl \
  --enable-libass \
  --enable-libfdk-aac \
  --enable-libfreetype \
  --enable-libmp3lame \
  --enable-libopus \
  --enable-libvorbis \
  --enable-libvpx \
  --enable-libx264 \
  --enable-libx265 \
  --enable-nonfree
PATH="$HOME/bin:$PATH" make
sudo make install
hash -r

