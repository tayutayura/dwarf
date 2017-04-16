#!/bin/bash

. ./get_os.sh

os=$(get_os)

#mkdir -p $HOME/.cache/dein
#cd $HOME/.cache/dein
#curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
#sh ./installer.sh $HOME/.cache/dein

if [ ${os} == 'Mac' ]; then
  echo "export XDG_CACHE_HOME="${HOME}/.cache"" >> $HOME/.bash_profile
  echo "export XDG_CONFIG_HOME="${HOME}/.config"" >> $HOME/.bash_profile
else
  echo -e "\nexport XDG_CACHE_HOME=\"$HOME/.cache\"" >> $HOME/.bashrc
  echo -e "export XDG_CONFIG_HOME=\"$HOME/.config\"" >> $HOME/.bashrc
fi

exec $SHELL -l
