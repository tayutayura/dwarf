#!/bin/bash

ricty__download_migu1m()
{
  local zipname="migu-1m.zip"
  curl -L "https://ja.osdn.net/frs/redir.php?m=iij&f=mix-mplus-ipa%2F63545%2Fmigu-1m-20150712.zip" -o "${zipname}"
  tar xvf ${zipname} --strip=1
  cp -f ./migu-1m-{regular,bold}.ttf ./Ricty/
}

ricty__download_inconsolata()
{
  wget "http://levien.com/type/myfonts/Inconsolata.otf" -O "Inconsolata.otf"
  cp -f ./Inconsolata.otf ./Ricty/
}

ricty__download_generator()
{
  git clone "https://github.com/kudryavka/Ricty.git" "Ricty"
}

ricty__generate()
{
  . ricty_generator.sh Inconsolata.otf migu-1m-{regular,bold}.ttf
}

ricty__install()
{
  cp -f Ricty*.ttf ~/Library/Fonts/
  fc-cache -vf
}

ricty__is_installed()
{
  local -i result=0
  while IFS= read -r font
  do
    if [[ ${font} =~ ^Ricty.*$ ]]; then
      result=1
      break
    fi
  done < <(ls ~/Library/Fonts)
  return ${result}
}

(
  ricty__is_installed
  if [ $? -eq 0 ]; then
    local tmpdir=$(mktemp -d)
    echo $tmpdir
    cd $tmpdir
    ricty__download_generator
    ricty__download_migu1m
    ricty__download_inconsolata
    cd ./Ricty/
    ricty__generate
    ricty__install
    rm -rf $tmpdir
  else
    info "Ricty has already installed!"
  fi
)
