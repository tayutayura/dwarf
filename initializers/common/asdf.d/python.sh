#!/bin/bash

ASDF_PYTHON2_VERSION='2.7.14'
ASDF_PYTHON3_VERSION='3.6.4'

detect_plugin python

if [ $? -eq 1 ]; then
  asdf plugin-add python https://github.com/tuvistavie/asdf-python.git
fi

##### python2 #####
detect_version python ${ASDF_PYTHON2_VERSION}

if [ $? -eq 1 ]; then
  asdf install python ${ASDF_PYTHON2_VERSION}
fi

detect_current_version python ${ASDF_PYTHON2_VERSION}

if [ $? -eq 1 ]; then
  asdf global python ${ASDF_PYTHON2_VERSION}
fi

if type nvim; then
  pip2 install neovim;
fi

asdf reshim python ${ASDF_PYTHON2_VERSION}

##### python3 #####
detect_version python ${ASDF_PYTHON3_VERSION}

if [ $? -eq 1 ]; then
  asdf install python ${ASDF_PYTHON3_VERSION}
fi

detect_current_version python ${ASDF_PYTHON3_VERSION}

if [ $? -eq 1 ]; then
  asdf global python ${ASDF_PYTHON3_VERSION}
fi

if type nvim; then
  pip3 install neovim;
fi

asdf reshim python ${ASDF_PYTHON3_VERSION}

if type nvim; then
  cat << END

Please add the following settings to 'init.vim'
--------------------------------------------------

let g:python_host_prog = expand(\"\${HOME}/.asdf/installs/python/${ASDF_PYTHON2_VERSION}/bin/python2\")
let g:python3_host_prog = expand(\"\${HOME}/.asdf/installs/python/${ASDF_PYTHON3_VERSION}/bin/python3\")

--------------------------------------------------

END
fi
