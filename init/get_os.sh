#!/bin/bash

get_os(){
  if [ "$(uname)" == 'Darwin' ]; then
    os='Mac'
  else
    os='Linux'
  fi

  echo ${os}
}

get_os
