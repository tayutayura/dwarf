echo -e "\033[0;32m[asdf] Install dependencies\033[0;39m"
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

echo -e "\033[0;32m[asdf] Clone asdf from Github\033[0;39m"
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.4.1

{
    echo ""
    echo "Please add the following settings to '.bashrc'"
    echo "--------------------------------------------------"
    echo ""
    echo "# SETUP asdf."
    echo ". $HOME/.asdf/asdf.sh"
    echo ". $HOME/.asdf/completions/asdf.bash"
    echo ""
    echo "--------------------------------------------------"
}
echo -e "\033[0;32m[asdf] Complete!\033[0;39m\n"

source ${HOME}/.bashrc

for file in ${HOME}/dotfiles/initializers/asdf.d/*.sh; do
  source ${file}
done

source ${HOME}/.bashrc
