#!/bin/bash

COMPONENT="backend"
LOG="/tmp/backend.log"

source common.sh    #This source command will pull the common.sh file locally that has functions & variables we had declared

COLOUR disabling nodejs
dnf module disable nodejs -y &>> $LOG

COLOUR Enabling nodeJS
dnf module enable nodejs:20 -y &>> $LOG

COLOUR installing nodejs
dnf install nodejs -y &>> $LOG

COLOUR Creating User expense
useradd -o expense &>> $LOG

COLOUR Creating app directory
mkdir -o /app &>> $LOG

COLOUR downloading $COMPONENT server
curl -o /tmp/backend.zip https://expense-web-app.s3.amazonaws.com/backend.zip &>> $LOG
cp backend.service /etc/systemd/system/backend.service &>> $LOG
cd /app &>> $LOG

COLOUR extracting $COMPONENT server
unzip -o /tmp/backend.zip
cd /app

COLOUR installing required files
npm install 

COLOUR Adding rights & permissions
chmod -R 775 /app
chown -R expense:expense /app

COLOUR installing mysql server
dnf install mysql-server -y

COLOUR connecting to mysql server with root
mysql -h localhost -uroot -pExpenseApp@1 < /app/schema/backend.sql

COLOUR system reload
systemctl daemon-reload

COLOUR enabling $COMPONENT
systemctl enable backend

COLOUR starting $COMPONENT
systemctl start backend

echo -e "\n\t ** $COMPONENT Installation is completed ** "