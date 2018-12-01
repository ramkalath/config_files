# on ubuntu
sudo apt-get -y install rxvt-unicode-256color
sudo apt-get -y install wmctrl
sudo apt-get -y install fonts-inconsolata

# to enable fullscreen for all other gui environments other than i3wm
mkdir -p ~/.urxvt/ext/
cp ~/config_files/urxvt/fullscreen ~/.urxvt/ext/

# to set some changes after configuration modification
rm ~/.Xresources
cd ~/
ln -s ~/config_files/urxvt/.Xresources_ubuntu $HOME/.Xresources 
xrdb ~/.Xresources

