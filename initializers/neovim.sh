#!/bin/bash

# Install Neovim
sudo yum -y install epel-release
sudo curl -o /etc/yum.repos.d/dperson-neovim-epel-7.repo https://copr.fedorainfracloud.org/coprs/dperson/neovim/repo/epel-7/dperson-neovim-epel-7.repo
sudo yum -y install neovim
echo -e "\nalias vi='/usr/bin/nvim'" >> ~/.bashrc

# Install dein
# mkdir -p $HOME/.cache/dein
# cd $HOME/.cache/dein
# curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
# sh ./installer.sh $HOME/.cache/dein

# echo -e "\nexport XDG_CACHE_HOME=\"$HOME/.cache\"" >> $HOME/.bashrc
# echo -e "export XDG_CONFIG_HOME=\"$HOME/.config\"" >> $HOME/.bashrc

exec $SHELL -l
