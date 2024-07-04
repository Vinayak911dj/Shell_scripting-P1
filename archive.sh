#!/bin/bash

#$Rev-001$
#$Thu Jul  4 07:43:40 CEST 2024$

#Variables
BASE=/home/emertxe/myscripts/projects
DAYS=10
DEPTH=1
RUN=0

#Check if the directory is present or not
if [ ! -d $BASE ]
then
    echo "Directory doesnt Exists: $BASE"
    exit 1
fi

#Create Archive Folder if not Present in Dicrectory
if [ ! -d $BASE/archive ]
then 
    mkdir $BASE/archive
fi

#Find the  list of Files Larger then 20MB
for i in $(find $BASE -maxdepth $DEPTH -type f -size +2M)
do
    if [ $RUN -eq 0 ]
    then
        echo "[ $(date "+%y-%m-%d %H:%M:%S")] archiving $i ==> $BASE/archive"
        gzip $i || exit 1
        mv $i.gz $BASE/archive ||exit 1
    fi
done






