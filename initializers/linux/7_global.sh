#!/bin/bash

if type pip3; then
  pip3 install pygments
fi

wget http://tamacom.com/global/global-6.6.2.tar.gz
tar zxvf global-6.6.2.tar.gz
cd global-6.6.2
PYTHON=~/.asdf/shims/python ./configure
make
sudo make install

