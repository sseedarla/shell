dnf module disable nodejs -y
dnf module disable nodejs -y


dnf install nodejs -y

useradd roboshop

mkdir /app

curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip
cd /app
unzip /tmp/user.zip

cd /app
npm install

cp user.service /etc/systemd/system/

systemctl daemon-reload

systemctl enable user

systemctl start user

