
#cd /etc/yum.repos.d/
#sudo rm -rf mongo.repo


#sudo cd /home/centos/shell

sudo set-hostname mongodb

sudo cp mongo.repo /etc/yum.repos.d/

sudo cd /home/centos/shell

sudo dnf install mongodb-org -y
dnf install mongodb-org-shell -y

sudo systemctl enable mongod
sudo systemctl start mongod

# You can edit file by using vim /etc/mongod.conf
#Update listen address from 127.0.0.1 to 0.0.0.0 in /etc/mongod.conf

sudo sed -i 's/bindIp: 127.0.0.1/bindIp: 0.0.0.0/' /etc/mongod.conf

 cd /
cat etc/mongod.conf

mongo --host mongodb.dev.sseedarla.site </app/schema/catalogue.js

sudo systemctl restart mongod

