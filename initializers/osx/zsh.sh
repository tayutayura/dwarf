#!/bin/bash

zsh__install()
{
  if [ ! -e "/bin/zsh" ]; then
    brew install zsh
  fi
}

zsh__chsh()
{
  if [ $(which "${SHELL}") != '/bin/zsh' ]; then
    chsh -s /bin/zsh
  fi
}

zsh__install_zplug()
{
  if [ ! -e "${HOME}/.zplug/init.zsh" ];then
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
  fi
}

zsh__install
zsh__chsh
zsh__install_zplug
