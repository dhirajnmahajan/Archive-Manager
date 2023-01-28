#!/bin/bash

#$Revision:001$
#$Wed 18 Jan 2023 03:07:34 PM CST

#variables
PATH=/home/user/Desktop/Sample/
DAYS=10
DEPTH=1
RUN=0

#check if the directory is present or not
if[ ! -d $PATH ]
then
	echo "directory does not exist: $PAth"
	exit 1
fi

#create 'archive' folder if not present
if [ ! $PATH/archive ]
then
	mkdir $PATH/archive
fi

#Find the list of files largest than 100MB
for i in 'find $PATH -maxdepth $DEPTH -type f -size +100M
do
     if [$RUN -eq 0 ]
     then
           echo "[$(date "+%Y-%m-%d %H:%M:%S")] archiving $i ==> $PATH/archive

         gzip $i || exit 1
	 mv $i.gz $PATH/archive || exit 1
     fi
  
done
