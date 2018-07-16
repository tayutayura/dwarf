#!/bin/bash

# Install Neovim
neovim__install()
{
  sudo yum -y install epel-release
  sudo curl -o /etc/yum.repos.d/dperson-neovim-epel-7.repo https://copr.fedorainfracloud.org/coprs/dperson/neovim/repo/epel-7/dperson-neovim-epel-7.repo
  sudo yum -y install neovim
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
