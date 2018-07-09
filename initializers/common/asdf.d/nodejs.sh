#!/bin/bash

ASDF_NODEJS_VERSION=9.4.0

detect_plugin nodejs

if [ $? -eq 1 ]; then
  asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
  bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
fi

detect_version nodejs ${ASDF_NODEJS_VERSION}

if [ $? -eq 1 ]; then
  asdf install nodejs ${ASDF_NODEJS_VERSION}
fi

detect_current_version nodejs ${ASDF_NODEJS_VERSION}

if [ $? -eq 1 ]; then
  asdf global nodejs ${ASDF_NODEJS_VERSION}
fi

if type nvim; then
  npm install -g neovim
fi

asdf reshim nodejs ${ASDF_NODEJS_VERSION}
