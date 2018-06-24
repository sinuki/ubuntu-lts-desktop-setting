#!/bin/bash

# Ubuntu The Entire System Backup Script
#
# author : parksw
# since : 2018.06.16

START=`date +%s`
BACKUP_FILE_NAME="ubuntu_$(date +%Y-%m-%d).tar.gz"

sudo tar cvpzf "$BACKUP_FILE_NAME" \
--one-file-system \
--exclude=/media/* \
--exclude=/mnt/* \
--exclude=/proc/* \
--exclude=/sys/* \
--exclude=/dev/* \
--exclude=/lost+found/* \
--exclude=*/*Trash* \
--exclude="*/$BACKUP_FILE_NAME" \
/

END=`date +%s`
PROCESS_TIME=`expr $END - $START`
PROCESS_HOURS=`expr $PROCESS_TIME / 60 / 24`
PROCESS_MINUTES=`expr $PROCESS_TIME / 60`
PROCESS_SECONDS=`expr $PROCESS_TIME % 60`

echo "[Complete] process time : $PROCESS_HOURS hours $PROCESS_MINUTES min $PROCESS_SECONDS sec"
