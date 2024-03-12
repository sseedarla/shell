script=$(realpath "$0")
script_path=$(dirname "$script")
app_user=roboshop

print_head(){
  echo -e "\e[36m»>>>>>>>> $1 <<<<<<<<\e[0m"
}

func_nodejs(){
print_head "module disable nodejs"
dnf module disable nodejs -y
  print_head "module enable nodejs:18"

dnf module enable nodejs:18 -y

 print_head "install nodejs"

dnf install nodejs -y
print_head  "useradd roboshop"

useradd ${app_user}

mkdir /app
 print_head "download dependencies"

curl -L -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}.zip
cd /app
unzip /tmp/${component}.zip
 print_head "npm install"

cd /app
npm install

 print_head "copy file to path location"

cp ${script_path}/${component}.service /etc/systemd/system/${component}.service


 print_head "daemon-reload"

systemctl daemon-reload
 print_head "enable user"

systemctl enable ${component}
print_head  "start user"

systemctl start ${component}
 print_head  "Huarry its done without any issues if you see this message !!"

}

