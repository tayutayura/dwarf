#!/bin/bash

# Install Neovim
sudo yum -y install epel-release
sudo curl -o /etc/yum.repos.d/dperson-neovim-epel-7.repo https://copr.fedorainfracloud.org/coprs/dperson/neovim/repo/epel-7/dperson-neovim-epel-7.repo
sudo yum -y install neovim

{
  echo ""
  echo "Please add the following settings to '.bashrc'"
  echo "--------------------------------------------------"
  echo ""
  echo "alias vi='/usr/bin/nvim'"
  echo "export XDG_CACHE_HOME=\"${HOME}/.cache\""
  echo "export XDG_CONFIG_HOME=\"${HOME}/.config\""
  echo ""
  echo "--------------------------------------------------"
}
