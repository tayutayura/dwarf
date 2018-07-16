#!/bin/bash

ASDF_GOLANG_VERSION=1.9

detect_plugin golang || result=$?
if [ ${result} -eq 0 ]; then
  asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
fi
unset result

detect_version golang ${ASDF_GOLANG_VERSION} || result=$?
if [ ${result} -eq 0 ]; then
  asdf install golang ${ASDF_GOLANG_VERSION}
fi
unset result

detect_current_version golang ${ASDF_GOLANG_VERSION} || result=$?
if [ ${result} -eq 0 ]; then
  asdf global golang ${ASDF_GOLANG_VERSION}
fi
unset result

asdf reshim golang ${ASDF_GOLANG_VERSION}
