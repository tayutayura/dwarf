#!/bin/bash

. ./get_os.sh

os=$(get_os)

if [ ${os} == 'Mac' ]; then
  brew install automake\
                autoconf\
                openssl\
                libyaml\
                readline\
                libxslt\
                libtool\
                unixodbc
else
  sudo yum -y install automake\
                      autoconf\
                      readline-devel\
                      ncurses-devel\
                      openssl-devel\
                      libyaml-devel\
                      libxslt-devel\
                      libffi-devel\
                      libtool\
                      unixODBC-devel
fi

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.2.1

if [ ${os} == 'Mac' ]; then
  # OR for Mac OSX
  echo '# SETUP asdf.' >> ~/.bash_profile
  echo '. $HOME/.asdf/asdf.sh' >> ~/.bash_profile
  echo '. $HOME/.asdf/completions/asdf.bash' >> ~/.bash_profile
else
  # For Ubuntu or other linux distros
  echo -e '\n# SETUP asdf.' >> ~/.bashrc
  echo -e '. $HOME/.asdf/asdf.sh' >> ~/.bashrc
  echo -e '. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
fi

exec $SHELL -l
