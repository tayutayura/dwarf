#!/bin/bash

ASDF_RUBY_VERSION=2.5.0

detect_plugin ruby
if [ $? -eq 0 ]; then
  asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
fi

detect_version ruby ${ASDF_RUBY_VERSION}
if [ $? -eq 0 ]; then
  asdf install ruby ${ASDF_RUBY_VERSION}
fi

detect_current_version ruby ${ASDF_RUBY_VERSION} 
if [ $? -eq 0 ]; then
  asdf global ruby ${ASDF_RUBY_VERSION}
fi

asdf__ruby_install_bundle()
{
  bundle --version > /dev/null 2>&1
  if [ $? -ne 0 ]; then
    gem install bundler
  fi
}

asdf__ruby_bundle()
{
  (
    cd ${DWARF_BASE_DIR}
    bundle install
  )
}

asdf__ruby_install_bundle
asdf__ruby_bundle
asdf reshim ruby ${ASDF_RUBY_VERSION}
