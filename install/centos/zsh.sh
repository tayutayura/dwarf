#!/bin/bash

# Install Zsh
zsh__install()
{
  sudo yum install -y zsh
}

zsh__chsh()
{
  sudo chsh -s /bin/zsh $(whoami)
}

zsh__install_zplug()
{
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
}

zsh__install
zsh__chsh
zsh__install_zplug
