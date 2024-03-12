script=$(realpath "$0")
script_path=$(dirname "$script")
source ${script_path}/common.sh

component=catalogue

func_nodejs
echo -e "\e[37m»>>>>>>>> copy mongo repo <<<<<<<<\e[0m"

cp ${script_path}/mongodb.repo /etc/yum.repos.d/mongodb.repo

yum install mongodb-org-shell -y
echo -e "\e[37m»>>>>>>>> import schema from mongo <<<<<<<<\e[0m"

mongo --host mongodb-dev.sseedarla.tech </app/schema/${component}.js

