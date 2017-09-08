#!/bin/bash

BACKUPFILE=/home/vinay/SharedData/Backup/Devices/AsusJK/`date +%Y-%m-%d`.tar
BACKUPFILELIST=/home/vinay/SharedData/Backup/Devices/AsusJK/listoffiles.txt
EXCLUDEFILE=/home/vinay/SharedData/Backup/Devices/AsusJK/excludefolders.txt

#### Get file list
ls -ad ~/.* | sed 1,2d | grep -v -f ${EXCLUDEFILE} > ${BACKUPFILELIST}

echo 'Backing up ' `wc -l ${BACKUPFILELIST} | cut -d ' ' -f 1` "INODES"
#####
yaourt -Qaa > packages.txt
#####Back them up
tar -cf ${BACKUPFILE} -T ${BACKUPFILELIST} packages.txt

####### compress it
gzip ${BACKUPFILE}

### Remove file
rm ${BACKUPFILELIST}

### update dot files
cd dotfiles/
git pull origin master
cd ..
rm -rf dotfiles.tar.gz
rm -f packages.txt
tar -czf dotfiles.tar.gz dotfiles
