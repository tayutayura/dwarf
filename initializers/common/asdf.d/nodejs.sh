#!/bin/bash

ASDF_NODEJS_VERSION=9.4.0

detect_plugin nodejs || result=$?
if [ ${result} -eq 0 ]; then
  asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
  bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
fi
unset result

detect_version nodejs ${ASDF_NODEJS_VERSION} || result=$?
if [ ${result} -eq 0 ]; then
  asdf install nodejs ${ASDF_NODEJS_VERSION}
fi
unset result

detect_current_version nodejs ${ASDF_NODEJS_VERSION} || result=$?
if [ ${result} -eq 0 ]; then
  asdf global nodejs ${ASDF_NODEJS_VERSION}
fi
unset result

check_npm_existence()
{
  local -i result=0
  while read -r line
  do
    if [[ ${line} =~ ^.*$1.*$ ]]; then
      result=1
      break
    fi
  done < <(npm ls -g "$1" 2> /dev/null)
  return ${result}
}

check_npm_existence neovim || result=$?
if type nvim > /dev/null && [ ${result} -eq 0 ]; then
  npm install -g neovim
fi
unset result

asdf reshim nodejs ${ASDF_NODEJS_VERSION}
