script=$(realpath "$0")
script_path=$(dirname "$script")
source ${script_path}/common.sh
mysql_root_password=$1
# $1 means First argument on input
#RoboShop@1
component=shipping

if [ -z "mysql_root_password" ]; then
  echo Please enter mysql_root_password and try again
  exit
  fi

cp ${script_path}/${component}.service /etc/systemd/system/${component}.service
common.sh==mysql


func_java

