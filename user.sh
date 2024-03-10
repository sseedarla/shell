script=$(realpath "$0")
script_path=$(dirname "$script")
source ${script_path}/common.sh

cp ${script_path}/user.service /etc/systemd/system/user.service


Function1
