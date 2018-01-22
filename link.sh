DOT_DIR="./dotfiles"
for file in ${DOT_DIR}/.??*; do
  ln -sv ${file} ${HOME}/`basename ${file}`
done
