#!/bin/bash

neovim__install()
{
  if [ ! -e "/usr/local/bin/nvim" ]; then
    brew install neovim/neovim/neovim
  else
    info "neovim has already installed!"
  fi
}

neovim__install_dein()
{
  (
    if [ -d $XDG_CACHE_HOME/dein ]; then
      mkdir -p $XDG_CACHE_HOME/dein
      cd $XDG_CACHE_HOME/dein
      curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
      sh ./installer.sh $XDG_CACHE_HOME/dein
    fi
  )
}

neovim__info()
{
  cat << END

Please add the following settings to '.bashrc'
--------------------------------------------------

export XDG_CACHE_HOME="\${HOME}/.cache"
export XDG_CONFIG_HOME="\${HOME}/.config"

if [ -f '/usr/bin/nvim' ]; then
  alias vi='/usr/bin/nvim'
fi

--------------------------------------------------

END
}

neovim__install
. ${HOME}/.bashrc
neovim__install_dein
neovim__info
