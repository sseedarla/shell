sudo systemctl stop mongod
sudo service mongod stop
sudo yum erase $(rpm -qa | grep mongodb)
