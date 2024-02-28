echo -e "\e[37m»>>>>>>>>    install golang     <<<<<<<<\e[0m"
dnf install golang -y
echo -e "\e[37m»>>>>>>>>   useradd roboshop      <<<<<<<<\e[0m"
useradd roboshop

echo -e "\e[37m»>>>>>>>> mkdir /app        <<<<<<<<\e[0m"
mkdir /app
echo -e "\e[37m»>>>>>>>>  curl -L -o        <<<<<<<<\e[0m"
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch.zip
cd /app
echo -e "\e[37m»>>>>>>>>   unzip /tmp/dispatch.zip      <<<<<<<<\e[0m"
unzip /tmp/dispatch.zip
echo -e "\e[37m»>>>>>>>>  cp dispatch.service       <<<<<<<<\e[0m"
cp dispatch.service /etc/systemd/system/

echo -e "\e[37m»>>>>>>>>  mod init dispatch       <<<<<<<<\e[0m"
cd /app
go mod init dispatch
go get
go build
echo -e "\e[37m»>>>>>>>> daemon-reload        <<<<<<<<\e[0m"
systemctl daemon-reload
echo -e "\e[37m»>>>>>>>>  start dispatch       <<<<<<<<\e[0m"
systemctl enable dispatch
systemctl start dispatch
#...
#     Devops-practice
#...