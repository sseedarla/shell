script=$(realpath "$0")
script_path=$(dirname "$script")
app_user=roboshop


func_nodejs(){
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

curl -L -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}.zip
cd /app
unzip /tmp/${component}.zip
echo -e "\e[37m»>>>>>>>> npm install <<<<<<<<\e[0m"

cd /app
npm install

echo -e "\e[37m»>>>>>>>> copy file to path location <<<<<<<<\e[0m"

cp ${script_path}/${component}.service /etc/systemd/system/${component}.service


echo -e "\e[37m»>>>>>>>> daemon-reload<<<<<<<<\e[0m"

systemctl daemon-reload
echo -e "\e[37m»>>>>>>>> enable user <<<<<<<<\e[0m"

systemctl enable ${component}
echo -e "\e[37m»>>>>>>>> start user <<<<<<<<\e[0m"

systemctl start ${component}
echo -e "\e[37m»>>>>>>>>  Huarry its done without any issues if you see this message !!<<<<<<<<\e[0m"

}

