#!/bin/bash 

# DATE="03AUG2024"                # This is called hardCoding 
 
DATE=$(date +%F)                  # This is how we can dynamically fetch the values
EXEC=$1 
DEPARTMENT=$2
echo "Todays date is $DATE"

# echo "Script Executed By $EXEC"
echo "Script Executed by $EXEC and from $DEPARTMENT"

# Arguments  : These arguments help sin fetching the values from the command line 
# These are mostly used to allow the users to supply the value or to override the values

# bash scriptName.sh   arg1  arg2 arg3 .. . . . arg9 
# bash scriptName.sh   firstArg secondArg  thrigArg 
# bash scriptName  10 20 30 