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

# asdf nodejs dependencies
sudo yum -y install perl-Digest-SHA

# asdf erlang dependencies
sudo yum -y install gcc\
                    gcc-c++\
                    glibc-devel\
                    make\
                    autoconf\
                    ncurses-devel\
                    openssl-devel\
                    java-1.8.0-openjdk-devel\
                    wxBase.x86_64\
                    fop\
                    unixODBC-devel
