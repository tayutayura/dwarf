#!/bin/bash

asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git

asdf install ruby 2.5.0
asdf global ruby 2.5.0

if type nvim; then
  gem install neovim
fi
