#!/bin/bash

COMPONENT="backend"
LOG="/tmp/backend.log"
APPUSER="expense"

source common.sh    #This source command will pull the common.sh file locally that has functions & variables we had declared

COLOUR Disabling default nodejs16
dnf module disable nodejs -y &>> $LOG
stat $?

COLOUR Enabling nodejs20
dnf module enable nodejs:20 -y &>> $LOG
stat $?

COLOUR installing nodejs20
dnf install nodejs -y &>> $LOG
stat $?

id $APPUSER &>> $LOG
if [ $? -ne 0 ] ; then
COLOUR Creating User $APPUSER service account
useradd $APPUSER &>> $LOG
stat $?
fi

COLOUR cleanup old app content
rm -rf /app  &>> $LOG
stat $?

COLOUR Creating app directory
mkdir /app &>> $LOG
stat $?

COLOUR downloading $COMPONENT server
curl -o /tmp/backend.zip https://expense-web-app.s3.amazonaws.com/backend.zip &>> $LOG

COLOUR configuring backend package
cp backend.service /etc/systemd/system/backend.service &>> $LOG
stat $?

COLOUR extracting $COMPONENT
cd /app
unzip -o /tmp/backend.zip &>> $LOG
stat $?

COLOUR Generting Artifacts
npm install &>> $LOG
stat $?

COLOUR Defining permissions to $APPUSER
chmod -R 775 /app
chown -R $APPUSER:$APPUSER /app
stat $?

COLOUR installing mysql client
dnf install mysql-server -y &>> $LOG
stat $?

COLOUR Injucting Schema to Mysql DB
mysql -h 172.31.84.122 -uroot -pExpenseApp@1 < /app/schema/backend.sql &>> $LOG
stat $?
#MYSQL-SERVER-IPADDRESS

COLOUR system reload
systemctl daemon-reload &>> $LOG
stat $?

COLOUR enabling $COMPONENT
systemctl enable backend &>> $LOG
stat $?

COLOUR starting $COMPONENT
systemctl start backend &>> $LOG
stat $?

echo -e "\n\t ** $COMPONENT Installation is completed ** "