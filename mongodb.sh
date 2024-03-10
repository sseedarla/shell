script=$(realpath "$0")
script_path=$(dirname "$script")
source ${script_path}/common.sh

echo -e "\e[37m»>>>>>>>>  copy  mongodb.repo to its location  /etc/yum.repos.d/     <<<<<<<<\e[0m"
cp ${script_path}/mongodb.repo /etc/yum.repos.d/
echo -e "\e[37m»>>>>>>>>  Install MongoDB <<<<<<<<\e[0m"

Install MongoDB
dnf install mongodb-org -y
echo -e "\e[37m»>>>>>>>>  enable mongod and start mongod<<<<<<<<\e[0m"

systemctl enable mongod
systemctl start mongod

echo -e "\e[37m»>>>>>>>>  update conf ipaddress  <<<<<<<<\e[0m"

sed -i -e 's|127.0.0.1|0.0.0.0|g' /etc/mongod.conf

echo -e "\e[37m»>>>>>>>>  restart mongod <<<<<<<<\e[0m"

systemctl restart mongod
echo -e "\e[37m»>>>>>>>>  Huarry its done without any issues if you see this message !!<<<<<<<<\e[0m"

