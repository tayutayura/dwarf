#!/bin/bash

# asdf dependencies
sudo yum install -y automake\
                    autoconf\
                    readline-devel\
                    ncurses-devel\
                    openssl-devel\
                    libyaml-devel\
                    libxslt-devel\
                    libffi-devel\
                    libtool\
                    unixODBC-devel

sudo yum -y install perl-Digest-SHA
