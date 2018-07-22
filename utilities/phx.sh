#!/bin/bash

if [ $# -ne 1 ]; then
  echo "引数に作成したいディレクトリ名を入力してください。"
  exit 1
fi

if [ ${OS:-''} == "CentOS" ]; then
  sudo yum -y install inotify-tools
fi

mix phx.new "$1" --database mysql --no-brunch --no-html

cd "$1"

mix ecto.create
