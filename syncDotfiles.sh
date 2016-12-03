#!/bin/bash

BACKUPFILE=/home/vinay/SharedData/Backup/`date +%Y-%m-%d`.tar
BACKUPFILELIST=/home/vinay/SharedData/Backup/listoffiles.txt
EXCLUDEFILE=/home/vinay/SharedData/Backup/excludefolders.txt

#### Get file list
ls -ad ~/.* | sed 1,2d | grep -v -f ${EXCLUDEFILE} > ${BACKUPFILELIST}

echo 'Backing up ' `wc -l ${BACKUPFILELIST} | cut -d ' ' -f 1` "INODES"

#####Back them up
tar -cf ${BACKUPFILE} -T ${BACKUPFILELIST}

####### compress it
gzip ${BACKUPFILE}

### Remove file
rm ${BACKUPFILELIST}

### update dot files
cd dotfiles/
git pull origin master
cd ..
tar -czf dotfiles.tar.gz dotfiles
