#!/bin/bash

ASDF_PYTHON2_VERSION='2.7.13'
ASDF_PYTHON3_VERSION='3.6.1'

detect_plugin python || result=$?
if [ ${result} -eq 0 ]; then
  asdf plugin-add python https://github.com/tuvistavie/asdf-python.git
fi
unset result


##### python2 #####

detect_version python ${ASDF_PYTHON2_VERSION} || result=$?
if [ ${result} -eq 0 ]; then
  asdf install python ${ASDF_PYTHON2_VERSION}
fi
unset result

detect_current_version python ${ASDF_PYTHON2_VERSION} || result=$?
if [ ${result} -eq 0 ]; then
  asdf global python ${ASDF_PYTHON2_VERSION}
fi
unset result

check_pip2_existence()
{
  local -i result=0
  while read -r line
  do
    if [[ ${line} =~ ^$1.*$ ]]; then
      result=1
      break
    fi
  done < <(pip2 list 2> /dev/null)
  return ${result}
}

check_pip2_existence neovim || result=$?
if type nvim > /dev/null && [ ${result} -eq 0 ]; then
  pip2 install neovim;
fi
unset result

asdf reshim python ${ASDF_PYTHON2_VERSION}


##### python3 #####

detect_version python ${ASDF_PYTHON3_VERSION} || result=$?
if [ ${result} -eq 0 ]; then
  asdf install python ${ASDF_PYTHON3_VERSION}
fi
unset result

detect_current_version python ${ASDF_PYTHON3_VERSION} || result=$?
if [ ${result} -eq 0 ]; then
  asdf global python ${ASDF_PYTHON3_VERSION}
fi
unset result

check_pip3_existence()
{
  local -i result=0
  while read -r line
  do
    if [[ ${line} =~ ^$1.*$ ]]; then
      result=1
      break
    fi
  done < <(pip3 list 2> /dev/null)
  return ${result}
}

check_pip3_existence neovim || result=$?
if type nvim > /dev/null && [ ${result} -eq 0 ]; then
  pip3 install neovim;
fi
unset result

asdf reshim python ${ASDF_PYTHON3_VERSION}

if type nvim > /dev/null; then
  cat << END

Please add the following settings to 'init.vim'
--------------------------------------------------

let g:python_host_prog = expand(\"\${HOME}/.asdf/installs/python/${ASDF_PYTHON2_VERSION}/bin/python2\")
let g:python3_host_prog = expand(\"\${HOME}/.asdf/installs/python/${ASDF_PYTHON3_VERSION}/bin/python3\")

--------------------------------------------------

END
fi
