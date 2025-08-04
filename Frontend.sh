dnf install nginx -y

systemctl enable nginx
systemctl start nginx

rm -rf /usr/share/nginx/html/*

curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip

#chaning the directory here to nginx
cd /usr/share/nginx/html
unzip /tmp/frontend.zip


#chaning directlory back to shell
cd /home/centos/shell

#copy roboshop.conf file to nginx
sudo cp roboshop.conf /etc/nginx/default.d/

#creating nginx file flow
#vim /etc/nginx/default.d/roboshop.conf


systemctl restart nginx