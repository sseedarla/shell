source common.sh

echo -e "\e[37m»>>>>>>>> install maven    <<<<<<<<\e[0m"

dnf install maven -y
echo -e "\e[37m»>>>>>>>> useradd roboshop <<<<<<<<\e[0m"

useradd ${app_user}


mkdir /app
echo -e "\e[37m»>>>>>>>> download dependencies <<<<<<<<\e[0m"

curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip
cd /app
unzip /tmp/shipping.zip
echo -e "\e[37m»>>>>>>>> copy shipping.service to  /etc/systemd/system/<<<<<<<<\e[0m"

cp shipping.service /etc/systemd/system/

cd /app
mvn clean package
echo -e "\e[37m»>>>>>>>> rename shipping - 1.0 to just jar<<<<<<<<\e[0m"

mv target/shipping-1.0.jar shipping.jar
echo -e "\e[37m»>>>>>>>> daemon-reload<<<<<<<<\e[0m"

systemctl daemon-reload
echo -e "\e[37m»>>>>>>>> enable and start shipping  <<<<<<<<\e[0m"

systemctl enable shipping
systemctl start shipping
echo -e "\e[37m»>>>>>>>> intall mysql server <<<<<<<<\e[0m"

dnf install mysql -y
echo -e "\e[37m»>>>>>>>> import schema  <<<<<<<<\e[0m"

mysql -h <MYSQL-SERVER-IPADDRESS> -uroot -pRoboShop@1 < /app/schema/shipping.sql

echo -e "\e[37m»>>>>>>>> restart shipping  <<<<<<<<\e[0m"

systemctl restart shipping
echo -e "\e[37m»>>>>>>>>  Huarry its done without any issues if you see this message !!<<<<<<<<\e[0m"
