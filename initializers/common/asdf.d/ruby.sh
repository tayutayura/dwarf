#!/bin/bash

ASDF_RUBY_VERSION=2.5.0

detect_plugin ruby

if [ $? -eq 1 ]; then
  asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
fi

detect_version ruby ${ASDF_RUBY_VERSION}

if [ $? -eq 1 ]; then
  asdf install ruby ${ASDF_RUBY_VERSION}
fi

detect_current_version ruby ${ASDF_RUBY_VERSION}

if [ $? -eq 1 ]; then
  asdf global ruby ${ASDF_RUBY_VERSION}
fi

if type nvim; then
  gem install neovim
fi

asdf reshim ruby ${ASDF_RUBY_VERSION}
