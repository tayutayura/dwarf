#!/bin/bash

ASDF_ELIXIR_VERSION="1.6.0"

detect_plugin elixir

if [ $? -eq 1 ]; then
  asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
fi

detect_version elixir ${ASDF_ELIXIR_VERSION}

if [ $? -eq 1 ]; then
  asdf install elixir ${ASDF_ELIXIR_VERSION}
fi

detect_current_version elixir ${ASDF_ELIXIR_VERSION}

if [ $? -eq 1 ]; then
  asdf global elixir ${ASDF_ELIXIR_VERSION}
fi

yes | mix local.hex

asdf reshim elixir ${ASDF_ELIXIR_VERSION}
