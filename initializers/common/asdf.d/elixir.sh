#!/bin/bash

ASDF_ELIXIR_VERSION="1.6.0"

asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git

asdf install elixir ${ASDF_ELIXIR_VERSION}-otp-${ASDF_ERLANG_VERSION}
asdf global elixir ${ASDF_ELIXIR_VERSION}-otp-${ASDF_ERLANG_VERSION}
