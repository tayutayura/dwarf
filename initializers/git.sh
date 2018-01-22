# Install Git dependencies
sudo yum install -y gcc\
                    gcc-c++\
                    curl-devel\
                    expat-devel\
                    gettext-devel\
                    openssl-devel\
                    zlib-devel\
                    perl-ExtUtils-MakeMaker\
                    git

# Update Git
## For Linux
cd /usr/local/src
sudo git clone git://git.kernel.org/pub/scm/git/git.git

cd git
sudo make prefix=/usr/local all
sudo make prefix=/usr/local install

# Reboot Shell
exec $SHELL -l
