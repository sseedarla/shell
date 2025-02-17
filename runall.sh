
cd /etc/yum.repos.d/
sudo rm -rf mongo.repo

cd /home/centos/shell
sudo mv mongo.repo /etc/yum.repos.d/
sudo bash mongodb.sh

sudo mv mysql.repo /etc/yum.repos.d/
sudo bash MySQL.sh


sudo bash Cart.sh

sudo mv catalogue.service /etc/systemd/system/
sudo bash Catalogue.sh
sudo bash Dispatch.sh

sudo mv roboshop.conf /etc/nginx/default.d/
sudo bash Frontend.sh


sudo bash Payment.sh
sudo bash RabbitMQ.sh
sudo bash Redis.sh
#sudo bash Shipping.sh
sudo bash User.sh









