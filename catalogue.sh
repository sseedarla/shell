dnf module disable nodejs -y
dnf module enable nodejs:18 -y

cp catalogue.service /etc/systemd/system/
dnf install nodejs -y
useradd roboshop


mkdir /app

curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
cd /app
unzip /tmp/catalogue.zip
npm install


systemctl daemon-reload
systemctl enable catalogue
systemctl start catalogue
