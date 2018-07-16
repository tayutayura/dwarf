#!/bin/bash

zsh__install()
{
  if [ ! -e "/bin/zsh" ]; then
    brew install zsh
    info "zsh is installed!"
    info "Please run:"
    info "  chsh -s /bin/zsh"
  else
    info "zsh has already installed!"
  fi
}

zsh__chsh()
{
  if [ $(which "${SHELL}") != '/bin/zsh' ]; then
    chsh -s /bin/zsh
  else
    info "You are already using /bin/zsh"
  fi
}

zsh__install_zplug()
{
  if [ ! -e "${HOME}/.zplug/init.zsh" ];then
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
  else
    info "zplug has already installed!"
  fi
}

zsh__install
# zsh__chsh
zsh__install_zplug
