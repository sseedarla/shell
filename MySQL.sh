dnf module disable mysql -y




dnf install mysql-community-server -y
systemctl enable mysqld
systemctl start mysqld

mysql_secure_installation --set-root-pass RoboShop@1


mysql -uroot -pRoboShop@1