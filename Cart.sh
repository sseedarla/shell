
echo -e "\e[37m»>>>>>>>> module disable nodejs <<<<<<<<\e[0m"

dnf module disable nodejs -y
echo -e "\e[37m»>>>>>>>> enable nodejs:18 <<<<<<<<\e[0m"
dnf module enable nodejs:18 -y
echo -e "\e[37m»>>>>>>>>install nodejs <<<<<<<<\e[0m"

dnf install nodejs -y
echo -e "\e[37m»>>>>>>>> useradd roboshop <<<<<<<<\e[0m"

useradd roboshop
echo -e "\e[37m»>>>>>>>>mkdir /app <<<<<<<<\e[0m"

mkdir /app
echo -e "\e[37m»>>>>>>>>curl -L -o download <<<<<<<<\e[0m"

curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip
cd /app
echo -e "\e[37m»>>>>>>>> unzip /tmp/cart.zip<<<<<<<<\e[0m"

unzip /tmp/cart.zip
echo -e "\e[37m»>>>>>>>>copy cart.service to /etc/systemd/system/ <<<<<<<<\e[0m"

cp cart.service /etc/systemd/system/
echo -e "\e[37m»>>>>>>>>npm install <<<<<<<<\e[0m"

npm install
echo -e "\e[37m»>>>>>>>>systemctl daemon-reload <<<<<<<<\e[0m"

systemctl daemon-reload
echo -e "\e[37m»>>>>>>>> systemctl enable cart and start<<<<<<<<\e[0m"

systemctl enable cart
systemctl start cart