#!/bin/bash
UserID=$(id -u)
if [ $UserID -ne 0 ]
	then
	echo"need root access"
	exit1
fi
VALIDATE(){
 If[ $? -ne 0 ]
 then
   echo"instal fail"
 else
   echo"instal succ"
 fi
  }
  
  yum install mysql -y
  
VALIDATE $?