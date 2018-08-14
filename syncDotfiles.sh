#!/bin/bash

############################## Settings  #######################################
BACKUPFOLDER=/home/vinay/SharedData/Backup/Devices/JOKER
BACKUPFILE=${BACKUPFOLDER}/`date +%Y-%m-%d`.tar
BACKUPFILELIST=${BACKUPFOLDER}/listoffiles.txt
EXCLUDEFILE=${BACKUPFOLDER}/excludefolders.txt

########################## Get file list #######################################
ls -ad ~/.* | sed 1,2d | grep -v -f ${EXCLUDEFILE} > ${BACKUPFILELIST}
echo 'Backing up ' `wc -l ${BACKUPFILELIST} | cut -d ' ' -f 1` "INODES"

######################## Packages ##############################################
pacman -Qqe > ${BACKUPFOLDER}/native_package.txt
pacman -Qm  > ${BACKUPFOLDER}/mannual_package.txt

##################### Back them up #############################################
tar -czf ${BACKUPFILE} -T ${BACKUPFILELIST} packages.txt

############################ Remove file #######################################
rm ${BACKUPFILELIST}
rm ${BACKUPFOLDER}/native_package.txt
rm ${BACKUPFOLDER}/mannual_package.txt

############################ Update dot files ##################################
cd ${BACKUPFOLDER}/dotfiles/
git pull origin master
cd ${BACKUPFOLDER}
rm -rf dotfiles.tar.gz
tar -czf dotfiles.tar.gz dotfiles

################################################################################
