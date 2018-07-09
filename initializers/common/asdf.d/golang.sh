#!/bin/bash

ASDF_GOLANG_VERSION=1.9

detect_plugin golang

if [ $? -eq 1 ]; then
  asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
fi

detect_version golang ${ASDF_GOLANG_VERSION}

if [ $? -eq 1 ]; then
  asdf install golang ${ASDF_GOLANG_VERSION}
fi

detect_current_version golang ${ASDF_GOLANG_VERSION}

if [ $? -eq 1 ]; then
  asdf global golang ${ASDF_GOLANG_VERSION}
fi

asdf reshim golang ${ASDF_GOLANG_VERSION}
