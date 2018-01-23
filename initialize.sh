DOT_DIR="./"

source "./check_os.sh"

if [ ${os} == 'Mac' ]; then
  INIT_DIR="./initializers/osx"
else
  INIT_DIR="./initializers/linux"
fi

COMMON_DIR="./initializers/common"

for file in ${INIT_DIR}/*.sh; do
  source ${file}
done

for file in ${COMMON_DIR}/*.sh; do
  source ${file}
done
