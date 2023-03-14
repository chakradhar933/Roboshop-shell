code_dir=$(pwd)
log_file=/tmp/roboshop.log
rm -f ${log_file}
echo -e "\e[31minstalling nginx\e[0m"
yum install nginx -y &>/tmp/out &>>${log_file}
#echo -e "\e[35mremove old content\e[0m"
rm -rf /usr/share/nginx/html/* &>>${log_file}
#echo -e "\e[31mdownload the content\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>${log_file}
cd /usr/share/nginx/html
unzip /tmp/frontend.zip &>>${log_file}
cp ${code_dir}/configs/nginx-roboshop.conf /etc/nginx/default.d/roboshop.conf & >>${log_file}
systemctl enable nginx &>>${log_file}
systemctl restart nginx &>>${log_file}

#
