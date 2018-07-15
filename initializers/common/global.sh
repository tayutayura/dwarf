#!/bin/bash

GLOBAL_VERSION=6.6.2

global__install_pygments()
{
  if type pip3; then
    pip3 install pygments
    return 0
  else
    return 1
  fi
}

global__install()
{
  if ! type global 2> /dev/null; then
    (
      cd ${HOME}
      wget http://tamacom.com/global/global-${GLOBAL_VERSION}.tar.gz
      tar zxvf global-${GLOBAL_VERSION}.tar.gz
      cd global-${GLOBAL_VERSION}
      PYTHON=${HOME}/.asdf/shims/python ./configure
      make
      make install
      cd ${HOME}
      rm -f global-${GLOBAL_VERSION}.tar.gz
      rm -rf global-${GLOBAL_VERSION}
    )
  fi
}

global__install_pygments
if [ $? -eq 0 ]; then
  global__install
else
  info "pygments is not installed. Please install pygments to install global."
fi
