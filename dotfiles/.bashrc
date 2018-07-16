# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export PATH="$HOME/.dwarf/bin:$PATH"

export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_CONFIG_HOME="${HOME}/.config"

if [ -f '/usr/bin/nvim' ]; then
  alias vi='/usr/bin/nvim'
fi

# Setup asdf.
if [[ -f "$HOME/.asdf/asdf.sh" && -f $HOME/.asdf/completions/asdf.bash ]]; then
  . $HOME/.asdf/asdf.sh
  . $HOME/.asdf/completions/asdf.bash
fi
