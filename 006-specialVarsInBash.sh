#!/bin/bash 

# Special Variables are the pre-defined variables with specific special pre-defined powers.

# Special Variables are $0 to $9, $* , $@, $# ,  $$
# Can you create special variables on Bash ? 100% No , you can just use the special variables that are offered.

a=1000 
TEAM=$1 
PROJECT=$2 
echo "Value of a is $a"
echo "scriptName is $0"

echo "Team name is $TEAM"
echo "$TEAM is from $PROJECT Project"

# $0 : Prints the name of the script you're running

### bash scriptName.sh    arg1   arg2   arg3   arg4 . . . . . . arg9
### bash scriptName.sh  firstArg   secondArg  thirdArd 
### bash abc.sh  10   20   30 
# bash arg1  arg2  arg3 arg4  arg5  arg6 arg7  arg8  arg9  arg10 
#        1     2     3    4    5     6    7      8    9      10
# ( You supply up to 9 arguments)

echo $0     # prints the scriptName
echo "Number Of Arguments in script are $#"     # Prints the no of arguments used in the script 
echo "Exit Status Of The Previous Command $?"                                         # Prints the exit code of the previous command 
echo "Arguments In The Script Are $*"           # Prints all the arguments used in the script
echo "Arguments In The Script Are $@"           # Prints all the arguments used in the script