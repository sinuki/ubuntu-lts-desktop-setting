#!/bin/bash

unzip D2coding.zip
DEFAULT_PATH="./d2codingfont-master"
LATEST_FILE=$(ls $DEFAULT_PATH | grep D2Coding | sort -r | head -n 1)
unzip $DEFAULT_PATH/$LATEST_FILE -d $DEFAULT_PATH
chmod -R 755 $DEFAULT_PATH/*

TARGET_PATH="/usr/share/fonts/truetype/D2Coding"
sudo mkdir -p $TARGET_PATH
sudo cp $DEFAULT_PATH/D2CodingAll/* $TARGET_PATH/
sudo chown -R root:root $TARGET_PATH
fc-cache -f
rm -rf $DEFAULT_PATH
rm -rf D2coding.zip
