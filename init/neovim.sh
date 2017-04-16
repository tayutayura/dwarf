#!/bin/bash

. ./get_os.sh

os=$(get_os)

if [ ${os} == 'Mac']; then
  brew install neovim/neovim/neovim
  echo "alias vi='/usr/local/bin/nvim'" >> ~/.bash_profile
else
  sudo yum -y install epel-release
  sudo curl -o /etc/yum.repos.d/dperson-neovim-epel-7.repo https://copr.fedorainfracloud.org/coprs/dperson/neovim/repo/epel-7/dperson-neovim-epel-7.repo
  sudo yum -y install neovim
  echo -e "\nalias vi='/usr/bin/nvim'" >> ~/.bashrc
fi

exec $SHELL -l
