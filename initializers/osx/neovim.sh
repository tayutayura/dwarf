#!/bin/bash

brew install neovim/neovim/neovim

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
