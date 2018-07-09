#!/bin/bash

# Install asdf dependencies
asdf__install_dependencies()
{
  brew install coreutils\
                automake\
                autoconf\
                openssl\
                libyaml\
                readline\
                libxslt\
                libtool\
                unixodbc
}

asdf__install_dependencies
. ${DWARF_INITIALIZERS_COMMON_DIR}/asdf.sh
