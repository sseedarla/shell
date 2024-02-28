echo -e "\e[37m»>>>>>>>> install python36   <<<<<<<<\e[0m"

dnf install python36 gcc python3-devel -y
echo -e "\e[37m»>>>>>>>> useradd roboshop   <<<<<<<<\e[0m"

useradd roboshop

mkdir /app
echo -e "\e[37m»>>>>>>>> download and unzip /tmp/payment.zip   <<<<<<<<\e[0m"

curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment.zip
cd /app
unzip /tmp/payment.zip
echo -e "\e[37m»>>>>>>>>  copy  payment.service to its location /etc/systemd/system/  <<<<<<<<\e[0m"

cp payment.service /etc/systemd/system/
echo -e "\e[37m»>>>>>>>> install -r requirements.txt   <<<<<<<<\e[0m"

cd /app
pip3.6 install -r requirements.txt
echo -e "\e[37m»>>>>>>>> systemctl daemon-reload   <<<<<<<<\e[0m"

systemctl daemon-reload
echo -e "\e[37m»>>>>>>>> enable & start payment   <<<<<<<<\e[0m"

systemctl enable payment
systemctl start payment
echo -e "\e[37m»>>>>>>>>  Huarry its done without any issues if you see this message !!<<<<<<<<\e[0m"