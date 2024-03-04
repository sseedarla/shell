sudo systemctl stop mongod
sudo service mongod stop
sudo yum erase $(rpm -qa | grep mongodb)
echo -e "\e[37m»>>>>>>>>  Huarry mongodb is removed and unstalled !!<<<<<<<<\e[0m"
