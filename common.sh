script=$(realpath "$0")
script_path=$(dirname "$script")
app_user=roboshop

func_print_head(){
  echo -e "\e[36m»>>>>>>>> $1 "
}


func_schema_setup(){
  if [ "$schema_setup" == "mongo" ]; then
  func_print_head  "copy mongo repo"

  cp ${script_path}/mongodb.repo /etc/yum.repos.d/mongodb.repo
func_print_head  " Install mongodb client "
  yum install mongodb-org-shell -y
   func_print_head  " import schema from mongo "

  mongo --host mongodb-dev.sseedarla.tech </app/schema/${component}.js
fi

  if [ "$schema_setup" == "mysql" ]; then
func_print_head " isntall mysql "
yum install mysql -y
func_print_head " import schema  "

mysql -h <mysql-dev.sseedarla.tech> -uroot -p${mysql_root_password} < /app/schema/{component}.sql
fi


}



func_app_prereq() {

func_print_head " useradd roboshop "
useradd ${app_user}

func_print_head " create directory "
rm -rf /app
mkdir /app

func_print_head " download dependencies "

curl -L -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}.zip
cd /app
unzip /tmp/${component}.zip
  }


func_systemd_setup() {


 func_print_head "copy file to path location"

cp ${script_path}/${component}.service /etc/systemd/system/${component}.service


 func_print_head "daemon ${component} reload"
systemctl daemon-reload

 func_print_head "enable ${component} service"
systemctl enable ${component}

func_print_head  "start ${component} service"
systemctl restart ${component}

func_print_head  "Huarrrry its done without any issues if you see this message !!"


  }


  func_nodejs(){
  func_print_head "module disable nodejs"
  dnf module disable nodejs -y
    func_print_head "module enable nodejs:18"

  dnf module enable nodejs:18 -y

   func_print_head "install nodejs"
  dnf install nodejs -y

  func_app_prereq

  func_print_head "npm install"
  cd /app
  npm install
  func_schema_setup
  func_systemd_setup

  }



func_java() {


func_print_head " install maven    "
dnf install maven -y

func_print_head " copy shipping.service to  /etc/systemd/system/"
cd /app
mvn clean package
func_print_head " rename shipping - 1.0 to just jar"
mv target/shipping-1.0.jar ${component}.jar


func_schema_setup
func_systemd_setup


}


