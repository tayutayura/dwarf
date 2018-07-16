#!/bin/bash

ASDF_RUBY_VERSION=2.5.0

detect_plugin ruby || result=$?
if [ ${result} -eq 0 ]; then
  asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
fi
unset result

detect_version ruby ${ASDF_RUBY_VERSION} || result=$?
if [ ${result} -eq 0 ]; then
  asdf install ruby ${ASDF_RUBY_VERSION}
fi
unset result

detect_current_version ruby ${ASDF_RUBY_VERSION} || result=$?
if [ ${result} -eq 0 ]; then
  asdf global ruby ${ASDF_RUBY_VERSION}
fi
unset result

check_gem_existence()
{
  local -i result=0
  while read -r line
  do
    # [[ はクォートしていなくても単語分割は行われない
    if [[ ${line} =~ ^$1.*$ ]]; then
      result=1
      break
    fi
  done < <(gem list 2> /dev/null)
  return ${result}
}

check_gem_existence neovim || result=$?
if type nvim > /dev/null && [ ${result} -eq 0 ]; then
  gem install neovim;
fi
unset result

asdf reshim ruby ${ASDF_RUBY_VERSION}
