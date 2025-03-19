#!/bin/bash

COMPONENT="mysql"
ID=$(id -u)
LOG="/tmp/mysql.log"

if [ $ID -ne 0 ]; then
   echo -e "\e[31m Script is expected to be executed as root user or with sudo scriptName.sh \e[0m"
   echo -e "\t sudo bash $0"
   exit 1
fi

stat() {
if [ $1 -eq 0 ] ; then
   echo -e "\e[32m success \e[0m"
else
   echo -e "\e[31m failure \e[0m"
fi 
}

COLOUR() {
echo -e "\e[35m $* \e[0m"

}


COLOUR installing $COMPONENT
dnf install mysql-server -y &>> LOG
stat=$?

COLOUR Enabling $COMPONENT
systemctl enable mysqld  &>> LOG

COLOUR Starting $COMPONENT
systemctl start  mysqld  &>> LOG

COLOUR COnfiguring $COMPONENT root passowrd
mysql_secure_installation --set-root-pass ExpenseApp@1 &>> LOG

echo -e "\t\n** Mysql Installation Completed **"
