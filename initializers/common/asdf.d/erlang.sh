#!/bin/bash

ASDF_ERLANG_VERSION="20.2.2"

detect_plugin erlang || result=$?
echo $result
if [ ${result} -eq 0 ]; then
  asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
fi
unset result

detect_version erlang ${ASDF_ERLANG_VERSION} || result=$?
if [ ${result} -eq 0 ]; then
  asdf install erlang ${ASDF_ERLANG_VERSION}
fi
unset result

detect_current_version erlang ${ASDF_ERLANG_VERSION} || result=$?
if [ ${result} -eq 0 ]; then
  asdf global erlang ${ASDF_ERLANG_VERSION}
fi
unset result

asdf reshim erlang ${ASDF_ERLANG_VERSION}
