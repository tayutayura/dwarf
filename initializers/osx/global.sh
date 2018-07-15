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
  if type global; then
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
if [ $? -ne 1 ]; then
  global__install
fi
