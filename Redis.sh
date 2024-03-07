script_path=$(dirname $0)
source ${script_path}/common.sh
echo ${app_user}


echo -e "\e[37m»>>>>>>>> install repos for redis <<<<<<<<\e[0m"

dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
echo -e "\e[37m»>>>>>>>> eanble redis <<<<<<<<\e[0m"
dnf module enable redis:remi-6.2 -y

#Install Redis
echo -e "\e[37m»>>>>>>>> isntall redis on server  <<<<<<<<\e[0m"
dnf install redis -y
echo -e "\e[37m»>>>>>>>> enabled and start redis  <<<<<<<<\e[0m"
#Update listen address from 127.0.0.1 to 0.0.0.0 in
# /etc/redis.conf & /etc/redis/redis.conf

systemctl enable redis
systemctl start redis
echo -e "\e[37m»>>>>>>>>  Huarry its done without any issues if you see this message !!<<<<<<<<\e[0m"

