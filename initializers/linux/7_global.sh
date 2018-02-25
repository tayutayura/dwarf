#!/bin/bash

wget http://tamacom.com/global/global-6.6.2.tar.gz
tar zxvf global-6.6.2.tar.gz
cd global-6.6.2
./configure
make
sudo make install
