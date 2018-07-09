#!/bin/bash

utils__update()
{
  sudo yum -y update
}

# Install utility tools
utils__install()
{
  sudo yum install -y epel-release \
                      yum-utils \
                      wget \
                      unzip \
                      ctags
}

utils__update
utils__install
