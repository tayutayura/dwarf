#!/bin/bash

sudo yum -y install gcc gcc-c++ curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-ExtUtils-MakeMaker
cd /usr/local/src
sudo wget https://www.kernel.org/pub/software/scm/git/git-2.11.0.tar.gz
sudo tar zxvf git-2.11.0.tar.gz
cd git-2.11.0
sudo make prefix=/usr/local all
sudo make prefix=/usr/local install

git config --global user.name "tayutayura"
git config --global user.email "tayutayura@gmail.com"
