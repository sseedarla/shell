script=$(realpath "$0")
script_path=$(dirname "$script")
source ${script_path}/common.sh

component=catalogue

func_nodejs

cp ${script_path}/mongo.repo /etc/yum.repos.d/mongo.repo
echo -e "\e[37m»>>>>>>>> install nodejs <<<<<<<<\e[0m"

dnf install mongodb-org-shell -y
echo -e "\e[37m»>>>>>>>> import schema from mongo <<<<<<<<\e[0m"

mongo --host mongodb-dev.sseedarla.tech </app/schema/catalogue.js

echo -e "\e[37m»>>>>>>>>  Huarry its done without any issues if you see this message !!<<<<<<<<\e[0m"
