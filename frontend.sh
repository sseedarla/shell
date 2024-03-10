script=$(realpath "$0")
script_path=$(dirname "$script")
source ${script_path}/common.sh

#Install Nginx
echo -e "\e[37m»>>>>>>>>  install nginx     <<<<<<<<\e[0m"
dnf install nginx -y
echo -e "\e[37m»>>>>>>>>  enable nginx and start     <<<<<<<<\e[0m"
#Start & Enable Nginx service
systemctl enable nginx
systemctl start nginx
echo -e "\e[37m»>>>>>>>>   copy roboshop.conf  to into location /etc/nginx/default.d/roboshop.conf    <<<<<<<<\e[0m"
#Create Nginx Reverse Proxy Configuration.

#cp roboshop.conf /etc/nginx/default.d/roboshop.conf
cp ${script_path}/roboshop.conf  /etc/nginx/default.d/roboshop.conf
echo -e "\e[37m»>>>>>>>> remove the existing file and data if already loaded   <<<<<<<<\e[0m"
#Remove the default content that web server is serving.
rm -rf /usr/share/nginx/html/*
echo -e "\e[37m»>>>>>>>>   download dependices     <<<<<<<<\e[0m"
#Download the frontend content
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
echo -e "\e[37m»>>>>>>>>  unzip files      <<<<<<<<\e[0m"
#Extract the frontend content.
cd /usr/share/nginx/html
unzip /tmp/frontend.zip
echo -e "\e[37m»>>>>>>>> restart nginx      <<<<<<<<\e[0m"


#Restart Nginx Service to load the changes of the configuration.
systemctl restart nginx
echo -e "\e[37m»>>>>>>>>  Huarry its done without any issues if you see this message !!<<<<<<<<\e[0m"


