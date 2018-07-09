#!/bin/bash

ASDF_ERLANG_VERSION="20.2.2"

detect_plugin erlang

if [ $? -eq 1 ]; then
  asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
fi

detect_version erlang ${ASDF_ERLANG_VERSION}

if [ $? -eq 1 ]; then
  asdf install erlang ${ASDF_ERLANG_VERSION}
fi

detect_current_version erlang ${ASDF_ERLANG_VERSION}

if [ $? -eq 1 ]; then
  asdf global erlang ${ASDF_ERLANG_VERSION}
fi

asdf reshim erlang ${ASDF_ERLANG_VERSION}
