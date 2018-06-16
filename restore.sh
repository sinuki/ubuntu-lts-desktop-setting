#!/bin/bash

# Ubuntu The Entire System Restore Script
#
# author : parksw
# since : 2108.06.16

echo 'Please, input backup file name.'
read BACKUP_FILE_NAME

sudo tar xvfzp $BACKUP_FILE_NAME -C /
