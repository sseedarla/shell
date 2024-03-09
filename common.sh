
app_user=roboshop


Function1(){
echo -e "\e[37m»>>>>>>>> module disable nodejs<<<<<<<<\e[0m"
dnf module disable nodejs -y
echo -e "\e[37m»>>>>>>>> module enable nodejs<<<<<<<<\e[0m"

dnf module enable nodejs:18 -y

echo -e "\e[37m»>>>>>>>> install nodejs <<<<<<<<\e[0m"

dnf install nodejs -y
echo -e "\e[37m»>>>>>>>> useradd roboshop <<<<<<<<\e[0m"

useradd ${app_user}

mkdir /app
echo -e "\e[37m»>>>>>>>> download dependencies <<<<<<<<\e[0m"

curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip
cd /app
unzip /tmp/user.zip
echo -e "\e[37m»>>>>>>>> npm install <<<<<<<<\e[0m"

cd /app
npm install

echo -e "\e[37m»>>>>>>>> daemon-reload<<<<<<<<\e[0m"

systemctl daemon-reload
echo -e "\e[37m»>>>>>>>> enable user <<<<<<<<\e[0m"

systemctl enable user
echo -e "\e[37m»>>>>>>>> start user <<<<<<<<\e[0m"

systemctl start user
echo -e "\e[37m»>>>>>>>>  Huarry its done without any issues if you see this message !!<<<<<<<<\e[0m"


}

