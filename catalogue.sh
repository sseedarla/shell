source common.sh

echo -e "\e[37m»>>>>>>>> module disable nodejs<<<<<<<<\e[0m"
dnf module disable nodejs -y
echo -e "\e[37m»>>>>>>>> module enable nodejs<<<<<<<<\e[0m"

dnf module enable nodejs:18 -y
echo -e "\e[37m»>>>>>>>> copy catalogue.service to  /etc/systemd/system/<<<<<<<<\e[0m"

cp catalogue.service /etc/systemd/system/
echo -e "\e[37m»>>>>>>>> mongo.repo to /etc/yum.repos.d/<<<<<<<<\e[0m"

cp mongo.repo /etc/yum.repos.d/
echo -e "\e[37m»>>>>>>>> install nodejs <<<<<<<<\e[0m"

dnf install nodejs -y
echo -e "\e[37m»>>>>>>>> useradd roboshop <<<<<<<<\e[0m"

useradd ${app_user}


mkdir /app
echo -e "\e[37m»>>>>>>>> download dependencies <<<<<<<<\e[0m"

curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
cd /app
echo -e "\e[37m»>>>>>>>> unzip /tmp/catalogue.zip <<<<<<<<\e[0m"

unzip /tmp/catalogue.zip
echo -e "\e[37m»>>>>>>>> npm install <<<<<<<<\e[0m"

npm install
echo -e "\e[37m»>>>>>>>>  install mongodb-org <<<<<<<<\e[0m"

dnf install mongodb-org-shell -y
echo -e "\e[37m»>>>>>>>> import schema from mongo <<<<<<<<\e[0m"

mongo --host MONGODB-SERVER-IPADDRESS </app/schema/catalogue.js

echo -e "\e[37m»>>>>>>>> daemon-reload<<<<<<<<\e[0m"

systemctl daemon-reload
echo -e "\e[37m»>>>>>>>> enable catalogue <<<<<<<<\e[0m"

systemctl enable catalogue
echo -e "\e[37m»>>>>>>>> start catalogue <<<<<<<<\e[0m"

systemctl start catalogue
echo -e "\e[37m»>>>>>>>>  Huarry its done without any issues if you see this message !!<<<<<<<<\e[0m"
