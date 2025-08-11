

sudo set-hostname catalogue
sudo cp catalogue.service /etc/systemd/system/


dnf module disable nodejs -y
dnf module enable nodejs:18 -y

dnf install nodejs -y


useradd roboshop

mkdir /app
cd /app
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip


unzip /tmp/catalogue.zip

cd /app
npm install



systemctl daemon-reload

systemctl enable catalogue
systemctl start catalogue


#sudo cp mongo.repo /etc/yum.repos.d/


#dnf install mongodb-org-shell -y

#mongo --host mongodb.dev.sseedarla.site </app/schema/catalogue.js

# Note
  #You need to update catalogue server ip address in frontend configuration.
  # Configuration file is /etc/nginx/default.d/roboshop.conf