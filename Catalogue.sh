


sudo cp catalogue.service /etc/systemd/system/


sudo dnf module disable nodejs -y
sudo dnf module enable nodejs:18 -y

sudo dnf install nodejs -y


sudo useradd roboshop

sudo mkdir /app
cd /app
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip


unzip /tmp/catalogue.zip

cd /app
npm install



systemctl daemon-reload

systemctl enable catalogue
systemctl start catalogue

cd /home/centos/shell

sudo cp mongo.repo /etc/yum.repos.d/


sudo dnf install mongodb-org-shell -y

sudo mongo --host mongodb.dev.sseedarla.site </app/schema/catalogue.js

# Note
  #You need to update catalogue server ip address in frontend configuration.
  # Configuration file is /etc/nginx/default.d/roboshop.conf