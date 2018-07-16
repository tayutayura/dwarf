#!/bin/bash

neovim__install()
{
  if [ ! -e "/usr/local/bin/nvim" ]; then
    brew install neovim/neovim/neovim
  else
    info "neovim has already installed!"
  fi
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
neovim__info
