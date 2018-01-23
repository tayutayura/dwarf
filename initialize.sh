DOT_DIR="./"

source "./check_os.sh"

if [ ${os} == 'Mac' ]; then
  INIT_DIR="./initializers/osx"
else
  INIT_DIR="./initializers/linux"
fi

for file in ${INIT_DIR}/*.sh; do
#echo ${file}
  source ${file}
done
