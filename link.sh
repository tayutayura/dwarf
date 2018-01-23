DOT_DIR="${HOME}/dotfiles/dotfiles"

for file in ${DOT_DIR}/.??*; do
  ln -sfnv ${file} ${HOME}/`basename ${file}`
done
