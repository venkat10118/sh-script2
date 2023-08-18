#!/bin/bash
UserID=$(id -u)
if [ $UserID -ne 0 ]
	then
	echo"need root access"
	exit1
fi
VALIDATE(){
 if [ $? -ne 0 ]
 then
   echo "$1 instal fail"
 else
   echo "$1 instal succ"
 fi
  }
  
  yum install postfix -y
  
VALIDATE $? "postfixsuc"