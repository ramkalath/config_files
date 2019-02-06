#Amme Sharanam
#!/bin/bash

sudo pacman -S wget zsh --noconfirm

# install oh-my-zsh
pushd $HOME/
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s /bin/zsh
wget https://raw.githubusercontent.com/jimeh/plain.zsh-theme/master/plain.zsh-theme ~/.oh-my-zsh/themes/

sudo ln -s $HOME/config_files/zsh/.zshrc $HOME/.zshrc

# remember you have to logout and login again for zsh to take effect

# run this command again if this does not take effect
# chsh -s /bin/zsh
