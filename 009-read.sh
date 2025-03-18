#!/bin/bash 

echo "This script will proceed by taking input from the user"
read -p "Enter Value Of A:" A
read -p "Enter Value Of B:" B
echo "Value of A is $A" 
echo "Value of B is $B" 
echo "Sum of A + B  = $((A+B))"   # Expresisons that are arithmetic should be enclosed in double paranthesis