dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y

dnf module enable redis:remi-6.2 -y

dnf install redis -y

sudo sed -i 's/bind 127.0.0.1/bind 0.0.0.0/' /etc/redis.conf



#Update listen address from 127.0.0.1 to 0.0.0.0 in /etc/redis.conf & /etc/redis/redis.conf
# You can edit file by using vim /etc/redis.conf & vim /etc/redis/redis.conf

systemctl enable redis
systemctl start redis