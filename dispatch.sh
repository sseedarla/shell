dnf install golang -y

useradd roboshop


mkdir /app

curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch.zip
cd /app
unzip /tmp/dispatch.zip

cp dispatch.service /etc/systemd/system/


cd /app
go mod init dispatch
go get
go build

systemctl daemon-reload

systemctl enable dispatch
systemctl start dispatch