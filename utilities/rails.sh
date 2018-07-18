#!/bin/bash

if [ $# -ne 1 ]; then
  echo "引数に作成したいディレクトリ名を入力してください。"
  exit 1
fi

type bundle > /dev/null 2>&1
if [ $? -ne 0 ]; then
  gem install bundler
fi

cat << EOS > Gemfile
source "http://rubygems.org"
gem 'rails', '~> 5.1', '>= 5.1.4'
EOS

bundle install --path vendor/bundle

bundle exec rails new "$1" --skip-bundle --database=mysql

rm -f Gemfile
rm -f Gemfile.lock
rm -rf .bundle
rm -rf vendor/bundle

cd "$1"

bundle install --path vendor/bundle
