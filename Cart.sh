dnf module disable nodejs -y
dnf module enable nodejs:18 -y

dnf install nodejs -y

useradd roboshop

mkdir /app

curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip
cd /app
unzip /tmp/cart.zip

cd /app
npm install

# You can create file by using vim /etc/systemd/system/cart.service
# /etc/systemd/system/cart.service

[Unit]
Description = Cart Service
[Service]
User=roboshop
Environment=REDIS_HOST=<REDIS-SERVER-IP>
Environment=CATALOGUE_HOST=<CATALOGUE-SERVER-IP>
Environment=CATALOGUE_PORT=8080
ExecStart=/bin/node /app/server.js
SyslogIdentifier=cart

[Install]
WantedBy=multi-user.target

systemctl daemon-reload

systemctl enable cart
systemctl start cart