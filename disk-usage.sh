#!/bin/bash


LOGFILE_DIRECTORY=/tmp
DATE=$(date +%F:%H:%M:%S)
SCRIPT_NAME=$0
LOGFILE=$LOGFILE_DIRECTORY/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"


DISK_USAGE=$(df -hT | grep -vE 'tmpfs|Filesystem')
disk_usage_threshold=1
#IFS= internal field separator is space
while IFS= read line
do 
  #this gives us usage in number format
   usage=$(echo $line | awk '{print $6}' | cut -d% -f1)

   #this command will give us partition 
   partition=$(echo $line | awk '{print $1}')

   #now we have to check if more than threshold or not
   if[ $usage -gt $disk_usage_threshold ];
   then
      message+="HIGH DISK USAGE on $partition: $usage"
    fi 
done <<< $DISK_USAGE

echo "message: $message"