#!/bin/bash

declare -a INSTALL_LIST=(wget jq gnupg)

# Install utility tools
utils__install()
{
  local -a install_list=("${INSTALL_LIST[@]}")
  while read -r formura
  do
    local -i i=0
    for f in ${install_list[@]}; do
      if [ "${formura}" == $f ]; then
        unset install_list[$i]
        install_list=("${install_list[@]}")
      fi
      let i++
    done
  done < <(brew list 2> /dev/null)

  if [ ${#install_list[@]} -ne 0 ]; then
    brew install ${install_list[@]}
  else
    info "utils are already installed."
  fi
}

utils__install
