dnf module disable nodejs -y
dnf module enable nodejs:18 -y

dnf install nodejs -y


useradd roboshop

mkdir /app

curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
cd /app
unzip /tmp/catalogue.zip

cd /app
npm install

[Unit]
Description = Catalogue Service

[Service]
User=roboshop
Environment=MONGO=true
Environment=MONGO_URL="mongodb://<MONGODB-SERVER-IPADDRESS>:27017/catalogue"
ExecStart=/bin/node /app/server.js
SyslogIdentifier=catalogue

[Install]
WantedBy=multi-user.target

# You can create file by using vim /etc/systemd/system/catalogue.service

# Ensure you replace <MONGODB-SERVER-IPADDRESS> with IP address

systemctl daemon-reload

systemctl enable catalogue
systemctl start catalogue


# create the file in /etc/yum.repos.d/mongo.repo
[mongodb-org-4.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.2/x86_64/
gpgcheck=0
enabled=1

dnf install mongodb-org-shell -y

mongo --host MONGODB-SERVER-IPADDRESS </app/schema/catalogue.js

# Note
  #You need to update catalogue server ip address in frontend configuration.
  # Configuration file is /etc/nginx/default.d/roboshop.conf