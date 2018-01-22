#!/bin/bash

os="$(uname)"

check_os(){
  if [ ${os} == 'Darwin' ]; then
    os='Mac'
  else
    os='Linux'
  fi

  echo "OS: ${os}"
}

check_os
