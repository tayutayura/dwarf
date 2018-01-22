sudo yum install -y automake\
                    autoconf\
                    readline-devel\
                    ncurses-devel\
                    openssl-devel\
                    libyaml-devel\
                    libxslt-devel\
                    libffi-devel\
                    libtool\
                    unixODBC-devel

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.4.1

# For Ubuntu or other linux distros
echo -e '\n# SETUP asdf.' >> ~/.bashrc
echo -e '. $HOME/.asdf/asdf.sh' >> ~/.bashrc
echo -e '. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc

exec $SHELL -l
