#!/bin/bash

COMPONENT="mysql"
LOG="/tmp/mysql.log"
ROOTPASS=$1

source common.sh    #This source command will pull the common.sh file locally that has functions & variables we had declared

COLOUR installing $COMPONENT
dnf install mysql-server -y &>> $LOG
stat $?

COLOUR Enabling $COMPONENT
systemctl enable mysqld  &>> $LOG
stat $?

COLOUR Starting $COMPONENT
systemctl start  mysqld  &>> $LOG
stat $?

COLOUR COnfiguring $COMPONENT root passowrd
mysql_secure_installation --set-root-pass $ROOTPASS &>> $LOG
stat $?

echo -e "\n\t** Mysql Installation Completed **"
