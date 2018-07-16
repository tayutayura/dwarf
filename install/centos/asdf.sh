#!/bin/bash

# asdf dependencies
asdf__install_dependencies()
{
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
}

# asdf nodejs dependencies
asdf__install_nodejs_dependencies()
{
  sudo yum -y install perl-Digest-SHA
}

asdf__install_ruby_dependencies()
{
  sudo yum -y install  bzip2 \
                       patch
}

asdf__install_python_dependencies()
{
  sudo yum -y install gcc\
                      gcc-c++\
                      make\
                      openssl-devel\
                      bzip2\
                      bzip2-devel\
                      zlib-devel\
                      readline-devel\
                      sqlite-devel\
                      sqlite\
                      zlib-devel
}

# asdf erlang dependencies
asdf__install_erlang_dependencies()
{
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
}

asdf__install_elixir_dependencies()
{
  sudo yum -y install unzip
}

asdf__install_dependencies
asdf__install_ruby_dependencies
asdf__install_python_dependencies
asdf__install_nodejs_dependencies
asdf__install_erlang_dependencies
asdf__install_elixir_dependencies
. ${DWARF_INSTALL_COMMON_DIR}/asdf.sh
