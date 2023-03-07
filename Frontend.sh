echo -e "\e[35minstalling nginx\e[0m"
yum install nginx -y
#echo -e "\e[35mremove old content\e[0m"
rm -rf /usr/share/nginx/html/*
#echo -e "\e[31mdownload the content\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
cd /usr/share/nginx/html
unzip /tmp/frontend.zip
cp configs/nginx-roboshop.conf /etc/nginx/default.d/roboshop.conf
systemctl enable nginx
systemctl restart nginx

#
