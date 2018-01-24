DOT_DIR="${HOME}/dwarf/dotfiles"

for file in ${DOT_DIR}/.??*; do
  ln -sfnv ${file} ${HOME}/`basename ${file}`
done
