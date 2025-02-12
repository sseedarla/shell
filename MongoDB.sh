


dnf install mongodb-org -y

systemctl enable mongod
systemctl start mongod

# You can edit file by using vim /etc/mongod.conf
#Update listen address from 127.0.0.1 to 0.0.0.0 in /etc/mongod.conf


systemctl restart mongod