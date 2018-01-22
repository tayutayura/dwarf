#!/bin/bash

mkdir -p $HOME/.cache/dein
cd $HOME/.cache/dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh $HOME/.cache/dein

echo -e "\nexport XDG_CACHE_HOME=\"$HOME/.cache\"" >> $HOME/.bashrc
echo -e "export XDG_CONFIG_HOME=\"$HOME/.config\"" >> $HOME/.bashrc

exec $SHELL -l
