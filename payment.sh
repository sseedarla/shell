script=$(realpath "$0")
script_path=$(dirname "$script")
source ${script_path}/common.sh
rabbitmq_appuser_password=$1
#roboshop123
#while entering you have to enter " sudo bash payment.sh roboshop123 " in the command line while you run this payment.sh bash file

component=payment

if [ -z "$rabbitmq_appuser_password" ]; then
  echo Please enter rabbitmq_appuser_password and try again ..
  exit
  fi


echo -e "\e[37m»>>>>>>>> install python36   <<<<<<<<\e[0m"

dnf install python36 gcc python3-devel -y
echo -e "\e[37m»>>>>>>>> useradd roboshop   <<<<<<<<\e[0m"

useradd ${app_user}

mkdir /app
echo -e "\e[37m»>>>>>>>> download and unzip /tmp/payment.zip   <<<<<<<<\e[0m"

curl -L -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}.zip
cd /app
unzip /tmp/${component}.zip
echo -e "\e[37m»>>>>>>>>  copy  payment.service to its location /etc/systemd/system/  <<<<<<<<\e[0m"

sed -i -e "s|rabbit_appuser_password|${rabbitmq_appuser_password}|" ${script_path}/${component}.service
cp ${script_path}/${component}.service /etc/systemd/system/${component}.service
echo -e "\e[37m»>>>>>>>> install -r requirements.txt   <<<<<<<<\e[0m"

cd /app
pip3.6 install -r requirements.txt
echo -e "\e[37m»>>>>>>>> systemctl daemon-reload   <<<<<<<<\e[0m"

systemctl daemon-reload
echo -e "\e[37m»>>>>>>>> enable & start payment   <<<<<<<<\e[0m"

systemctl enable ${component}
systemctl start ${component}
