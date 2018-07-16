#!/bin/bash

declare -a NPM__GLOBAL_PACKAGES=(yarn)

npm__install_to_global()
{
  npm --global install ${NPM__GLOBAL_PACKAGES[@]}
}

npm__install_to_global
