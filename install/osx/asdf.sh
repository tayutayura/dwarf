#!/bin/bash

# Install asdf dependencies
asdf__install_dependencies()
{
  local -a install_list=(coreutils automake autoconf openssl libyaml readline libxslt libtool unixodbc)
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
    info "asdf dependencies are already installed."
  fi
}

asdf__install_dependencies
. ${DWARF_INSTALL_COMMON_DIR}/asdf.sh
