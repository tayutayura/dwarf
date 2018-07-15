#!/bin/bash

brew__install()
{
  if ! type brew 1> /dev/null; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    info "brew has already installed!"
  fi
}

brew__install_cask()
{
  if [ ! -d /usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask ]; then
    brew tap caskroom/cask
  else
    info "homebrew-cask has already installed!"
  fi
}

brew__install
brew__install_cask
