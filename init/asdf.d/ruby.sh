#!/bin/bash

asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git

asdf install ruby 2.4.0
asdf global ruby 2.4.0

gem install neovim
