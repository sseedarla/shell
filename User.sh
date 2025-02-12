dnf module disable nodejs -y
dnf module enable nodejs:18 -y

dnf install nodejs -y

useradd roboshop

mkdir /app

curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip
cd /app
unzip /tmp/user.zip

cd /app
npm install

#You can create file by using vim /etc/systemd/system/user.service

[Unit]
Description = User Service
[Service]
User=roboshop
Environment=MONGO=true
Environment=REDIS_HOST=<REDIS-SERVER-IP>
Environment=MONGO_URL="mongodb://<MONGODB-SERVER-IP-ADDRESS>:27017/users"
ExecStart=/bin/node /app/server.js
SyslogIdentifier=user

[Install]
WantedBy=multi-user.target


systemctl daemon-reload

systemctl enable user
systemctl start user