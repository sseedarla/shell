
#You can create file by using vim /etc/yum.repos.d/mongo.repo
[mongodb-org-4.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.2/x86_64/
gpgcheck=0
enabled=1

dnf install mongodb-org -y

systemctl enable mongod
systemctl start mongod

# You can edit file by using vim /etc/mongod.conf

systemctl restart mongod