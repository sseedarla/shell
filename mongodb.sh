cp mongodb.repo /etc/yum.repos.d/

#Install MongoDB
#dnf install mongodb-org -y

systemctl enable mongod
systemctl start mongod

cd /etc

sed -i -e '10s|127.0.0.1|0.0.0.0|g' mongod.conf

systemctl restart mongod

