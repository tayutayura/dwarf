INIT_DIR="./initializers"
for file in ${INIT_DIR}/*.sh; do
  source $file
done
