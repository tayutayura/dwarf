#!/bin/bash

# ASDF_ERLANG_VERSION="20.2.2"
ASDF_ERLANG_VERSION="20.1"

asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git

asdf install erlang ${ASDF_ERLANG_VERSION}
asdf global erlang ${ASDF_ERLANG_VERSION}
