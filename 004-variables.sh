#!/bin/bash

# What is a variable ?
# A variable is something that holds data and can change dynamically

# This is how declare the variables 
# a=10
# name=mike 
# op=plus 

# In java,  int a=10 , char a=X , string x=Mike, float a=1.5

# the advantage & disadvantage in shell is that there are no Data Types

# In bash, everything will be considered as string by default.

a=10                                # ( a is key and 10 is the value )
b=1.5                               # Hardcoding the values 
name=mike 

# How to access the variable ? 
echo a
echo b

# $ is a special variable and this helps you in printing the value of the variable 
# Using $ we can access the value of variable 
echo -e "Value of a is \e[32m $a \e[0m"
echo -e "Value of b is \e[32m $b \e[0m"

# Whenever you're using special variables, single quote is going to nullify the speciality of the special varaible
echo ${a}
echo $a 

echo "${a}"
echo '${a}'    

# Printing a variable, wher ethe value of it is not declared , what will happen ? It will print null.
echo "The value of the variable d is ${d}"

# rm -rf /data/prod/${APPDATA} ====> /data/prod/shipping
# rm -rf /data/prod/${APPDATA} ====> /data/prod