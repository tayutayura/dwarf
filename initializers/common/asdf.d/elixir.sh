#!/bin/bash

ASDF_ELIXIR_VERSION="1.6.0"

detect_plugin elixir
if [ $? -eq 0 ]; then
  asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
fi

detect_version elixir ${ASDF_ELIXIR_VERSION}
if [ $? -eq 0 ]; then
  asdf install elixir ${ASDF_ELIXIR_VERSION}
fi

detect_current_version elixir ${ASDF_ELIXIR_VERSION}
if [ $? -eq 0 ]; then
  asdf global elixir ${ASDF_ELIXIR_VERSION}
fi

check_mix_existence()
{
  local -i result=0
  while read -r formura
  do
    if [[ ${formura} == $1 ]]; then
      result=1
      break
    fi
  done < <(mix local | awk '{print $2}' 2> /dev/null)
  return ${result}
}

check_mix_existence hex
if [ $? -eq 0 ]; then
  yes | mix local.hex
fi

asdf reshim elixir ${ASDF_ELIXIR_VERSION}
