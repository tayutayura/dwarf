#!/bin/bash

ASDF_PYTHON2_VERSION='2.7.13'
ASDF_PYTHON3_VERSION='3.6.1'

detect_plugin python
if [ $? -eq 0 ]; then
  asdf plugin-add python https://github.com/tuvistavie/asdf-python.git
fi


##### python2 #####

detect_version python ${ASDF_PYTHON2_VERSION}
if [ $? -eq 0 ]; then
  asdf install python ${ASDF_PYTHON2_VERSION}
fi

detect_current_version python ${ASDF_PYTHON2_VERSION}
if [ $? -eq 0 ]; then
  asdf global python ${ASDF_PYTHON2_VERSION}
fi

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

check_pip2_existence neovim
if [ $? -eq 0 ] && type nvim > /dev/null; then
  pip2 install neovim;
fi

asdf reshim python ${ASDF_PYTHON2_VERSION}


##### python3 #####

detect_version python ${ASDF_PYTHON3_VERSION}
if [ $? -eq 0 ]; then
  asdf install python ${ASDF_PYTHON3_VERSION}
fi

detect_current_version python ${ASDF_PYTHON3_VERSION}
if [ $? -eq 0 ]; then
  asdf global python ${ASDF_PYTHON3_VERSION}
fi

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

check_pip3_existence neovim
if [ $? -eq 0 ] && type nvim > /dev/null; then
  pip3 install neovim;
fi

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
