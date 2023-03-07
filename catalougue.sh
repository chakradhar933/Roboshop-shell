curl -sL https://rpm.nodesource.com/setup_lts.x | bash
yum install nodejs -y
useradd roboshop
mkdir /app
#we have to clean the code inside the app dirctory .
rm -rf /app/*
curl -L -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
cd /app
unzip /tmp/catalogue.zip
cd /app
npm install
cp configs/catalougue.service /etc/systemd/system/catalougue.service
systemctl daemon-reload
systemctl enable catalogue
systemctl start catalogue
cp configs/mongodb.repo /etc/yum.repos.d/mongodb.repo
yum install mongodb-org-shell -y
mongo --host mongodb.perrie.cloud </app/schema/catalogue.js

