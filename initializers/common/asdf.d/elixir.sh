#!/bin/bash

ASDF_ELIXIR_VERSION="1.6.0"

detect_plugin elixir || result=$?
if [ ${result} -eq 0 ]; then
  asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
fi
unset result

detect_version elixir ${ASDF_ELIXIR_VERSION} || result=$?
if [ ${result} -eq 0 ]; then
  asdf install elixir ${ASDF_ELIXIR_VERSION}
fi
unset result

detect_current_version elixir ${ASDF_ELIXIR_VERSION} || result=$?
if [ ${result} -eq 0 ]; then
  asdf global elixir ${ASDF_ELIXIR_VERSION}
fi
unset result

check_mix_existence()
{
  local -i result=0
  while IFS= read -r formura
  do
    if [[ ${formura} == $1 ]]; then
      result=1
      break
    fi
  done < <(mix local | awk '{print $2}' 2> /dev/null)
  return ${result}
}

check_mix_existence hex || result=$?
if [ ${result} -eq 0 ]; then
  yes | mix local.hex
fi
unset result

asdf reshim elixir ${ASDF_ELIXIR_VERSION}
