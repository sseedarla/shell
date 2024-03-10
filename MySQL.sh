script=$(realpath "$0")
script_path=$(dirname "$script")
source ${script_path}/common.sh

echo -e "\e[37m»>>>>>>>>  disable existing MySQL and update update new     <<<<<<<<\e[0m"

dnf module disable mysql -y
echo -e "\e[37m»>>>>>>>>  copy repo file to into location      <<<<<<<<\e[0m"

cp ${script_path}/mysql.repo /etc/yum.repos.d/mysql.repo
echo -e "\e[37m»>>>>>>>>  install mysql-community-server      <<<<<<<<\e[0m"

dnf install mysql-community-server -y
echo -e "\e[37m»>>>>>>>>  enable and start mysqld    <<<<<<<<\e[0m"

systemctl enable mysqld
systemctl start mysqld
echo -e "\e[37m»>>>>>>>>  mysql_secure_installation      <<<<<<<<\e[0m"

mysql_secure_installation --set-root-pass RoboShop@1
echo -e "\e[37m»>>>>>>>>  add password      <<<<<<<<\e[0m"

mysql -uroot -pRoboShop@1

