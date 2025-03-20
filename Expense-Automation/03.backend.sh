#!/bin/bash

COMPONENT="backend"
LOG="/tmp/backend.log"

source common.sh    #This source command will pull the common.sh file locally that has functions & variables we had declared

COLOUR disabling nodejs
dnf module disable nodejs -y &>> $LOG
stat $?

COLOUR Enabling nodeJS
dnf module enable nodejs:20 -y &>> $LOG
stat $?

COLOUR installing nodejs
dnf install nodejs -y &>> $LOG
stat $?

COLOUR Creating User expense
useradd -o expense &>> $LOG
stat $?

COLOUR Creating app directory
mkdir -o /app &>> $LOG
stat $?

COLOUR downloading $COMPONENT server
curl -o /tmp/backend.zip https://expense-web-app.s3.amazonaws.com/backend.zip &>> $LOG

COLOUR copying backend package
cp backend.service /etc/systemd/system/backend.service &>> $LOG
stat $?

cd /app &>> $LOG

COLOUR extracting $COMPONENT server
unzip -o /tmp/backend.zip
stat $?

cd /app

COLOUR installing required files
npm install 
stat $?

COLOUR Adding rights & permissions
chmod -R 775 /app
chown -R expense:expense /app
stat $?

COLOUR installing mysql server
dnf install mysql-server -y
stat $?

COLOUR connecting to mysql server with root
mysql -h localhost -uroot -pExpenseApp@1 < /app/schema/backend.sql
stat $?

COLOUR system reload
systemctl daemon-reload
stat $?

COLOUR enabling $COMPONENT
systemctl enable backend
stat $?

COLOUR starting $COMPONENT
systemctl start backend
stat $?

echo -e "\n\t ** $COMPONENT Installation is completed ** "