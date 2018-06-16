#!/bin/bash

# Ubuntu The Entire System Backup Script
#
# author : parksw
# since : 2018.06.16

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
