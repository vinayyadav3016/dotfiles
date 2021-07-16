#!/bin/bash

DEVICE=JOKER
############################## Settings  #######################################
BACKUPFOLDER=/home/vinay/backup/Devices/SystemsBackUp/${DEVICE}
BACKUPFILE=${BACKUPFOLDER}/${DEVICE}_home_dotfile_`date +%Y-%m-%d`.tar.gz
BACKUPFILELIST=${BACKUPFOLDER}/listoffiles.txt
EXCLUDEFILE=${BACKUPFOLDER}/excludefolders.txt

########################## Get file list #######################################
ls -ad ~/.* | sed 1,2d | grep -v -f ${EXCLUDEFILE} > ${BACKUPFILELIST}
echo 'Backing up ' `wc -l ${BACKUPFILELIST} | cut -d ' ' -f 1` "INODES"

######################## Packages ##############################################
pacman -Qqe > ${BACKUPFOLDER}/native_package.txt
pacman -Qm  > ${BACKUPFOLDER}/mannual_package.txt

##################### Back them up #############################################
tar -I pigz -cf ${BACKUPFILE} -T ${BACKUPFILELIST} ${BACKUPFOLDER}/native_package.txt ${BACKUPFOLDER}/mannual_package.txt
##################### Back them up #############################################
BACKUPFILE=${BACKUPFOLDER}/${DEVICE}_etc_`date +%Y-%m-%d`.tar.gz
sudo tar -I pigz -cf ${BACKUPFILE} /etc
BACKUPFILE=${BACKUPFOLDER}/${DEVICE}_boot_`date +%Y-%m-%d`.tar.gz
sudo tar -I pigz -cf ${BACKUPFILE} /boot

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
