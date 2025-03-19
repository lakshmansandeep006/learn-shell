dnf module disable nodejs -y
dnf module enable nodejs:20 -y 
dnf install nodejs -y 
useradd expense
mkdir /app 
curl -o /tmp/backend.zip https://expense-web-app.s3.amazonaws.com/backend.zip 
cp backend.service /etc/systemd/system/backend.service
cd /app 
unzip -o /tmp/backend.zip
cd /app 
npm install 
chmod -R 775 /app
chown -R expense:expense /app
dnf install mysql-server -y
mysql -h 172.31.33.204 -uroot -pExpenseApp@1 < /app/schema/backend.sql
systemctl daemon-reload
systemctl enable backend 
systemctl start backend 