#!/bin/bash

# only Linux

cd /usr/local/src
sudo git clone git://git.kernel.org/pub/scm/git/git.git

cd git
sudo make prefix=/usr/local all
sudo make prefix=/usr/local install
