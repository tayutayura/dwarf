#!/bin/bash

declare -a INSTALL_LANG_SCRIPTS=(ruby.sh python.sh nodejs.sh golang.sh erlang.sh elixir.sh)

# Install asdf
asdf__download()
{
  if [ ! -d "${HOME}/.asdf" ]; then
    git clone https://github.com/asdf-vm/asdf.git ${HOME}/.asdf --branch v0.5.0
  else
    info "asdf has already installed!"
  fi
}

asdf__info()
{
  cat << END

Please add the following settings to '.bashrc'
--------------------------------------------------

# Setup asdf.
if [[ -f "\$HOME/.asdf/asdf.sh" && -f \$HOME/.asdf/completions/asdf.bash ]]; then
  . \$HOME/.asdf/asdf.sh
  . \$HOME/.asdf/completions/asdf.bash
fi

--------------------------------------------------

END
}

asdf__install_languages()
{
  local asdf_lang_dir=${DWARF_INSTALL_COMMON_DIR}/asdf.d
  local -a install_lang_scripts=("${INSTALL_LANG_SCRIPTS[@]}")
  for script in ${install_lang_scripts[@]}
  do
    . ${asdf_lang_dir}/${script}
  done
}

detect_plugin()
{
  local -i result=0
  while read -r plugin
  do
    if [ "${plugin}" == "$1" ]; then
      result=1
    fi
  done < <(asdf plugin-list 2> /dev/null)
  return ${result}
}

detect_version()
{
  local -i result=0
  while read -r version
  do
    if [ "${version}" == "$2" ];then
      result=1
    fi
  done < <(asdf list "$1" 2> /dev/null)
  return ${result}
}

detect_current_version()
{
  local -i result=0
  local current_version=$(asdf current "$1" | awk '{print $1}')
  if [ "${current_version}" == "$2" ]; then
    result=1
  fi
  return ${result}
}

asdf__download
asdf__info
. ${HOME}/.bashrc
asdf__install_languages
