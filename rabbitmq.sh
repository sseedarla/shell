script=$(realpath "$0")
script_path=$(dirname "$script")
source ${script_path}/common.sh

echo -e "\e[37m»>>>>>>>>  download packages    <<<<<<<<\e[0m"

curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash

echo -e "\e[37m»>>>>>>>> install packages <<<<<<<<\e[0m"

curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash
echo -e "\e[37m»>>>>>>>> isntall rabbitmq server      <<<<<<<<\e[0m"

dnf install rabbitmq-server -y
echo -e "\e[37m»>>>>>>>> enable and start server     <<<<<<<<\e[0m"

systemctl enable rabbitmq-server
systemctl start rabbitmq-server
echo -e "\e[37m»>>>>>>>> add user    <<<<<<<<\e[0m"

rabbitmqctl add_user ${app_user} roboshop123
echo -e "\e[37m»>>>>>>>> set permissions to the user   <<<<<<<<\e[0m"

rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"

echo -e "\e[37m»>>>>>>>>  Huarry its done without any issues if you see this message !!<<<<<<<<\e[0m"
