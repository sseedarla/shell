script=$(realpath "$0")
script_path=$(dirname "$script")
source ${script_path}/common.sh
mysql_root_password=$1
# $1 means First argument on input
#RoboShop@1
component=shipping


echo -e "\e[37m»>>>>>>>> install maven    <<<<<<<<\e[0m"

dnf install maven -y
echo -e "\e[37m»>>>>>>>> useradd roboshop <<<<<<<<\e[0m"

useradd ${app_user}

mkdir /app
echo -e "\e[37m»>>>>>>>> download dependencies <<<<<<<<\e[0m"

curl -L -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}.zip
cd /app
unzip /tmp/${component}.zip
echo -e "\e[37m»>>>>>>>> copy shipping.service to  /etc/systemd/system/<<<<<<<<\e[0m"

cd /app
mvn clean package
echo -e "\e[37m»>>>>>>>> rename shipping - 1.0 to just jar<<<<<<<<\e[0m"

mv target/shipping-1.0.jar ${component}.jar
echo -e "\e[37m»>>>>>>>> isntall mysql <<<<<<<<\e[0m"

yum install mysql -y
echo -e "\e[37m»>>>>>>>> import schema  <<<<<<<<\e[0m"

mysql -h <mysql-dev.sseedarla.tech> -uroot -p${mysql_root_password} < /app/schema/${component}.sql

cp ${script_path}/${component}.service /etc/systemd/system/${component}.service

systemctl daemon-reload
echo -e "\e[37m»>>>>>>>> enable and start shipping  <<<<<<<<\e[0m"

systemctl enable ${component}
systemctl start ${component}
