#!/bin/bash

# Ubuntu 18.04LTS initial settings shell script
# 
# author : parksw
# since  : 2018.06.13

CURRENT_PATH=`pwd`
DEFAULT_COMMAND="sudo apt install -y"

# remove default dock
sudo apt remove -y gnome-shell-extension-ubuntu-dock

# vim & config
$DEFAULT_COMMAND vim
echo 'set hlsearch " 검색어 하이라이팅
set nu	" 라인 표시
set autoindent	" 자동 들여쓰기
set showmatch	" 일치하는 괄호 하이라이팅
set smartcase	" 대소문자 구분
set ruler	" 현재 커서 위치 표시
set shiftwidth=4	" 자동 들여쓰기 너비
set tabstop=4

if has("syntax")
    syntax on
endif
' > "$HOME/.vimrc"

# gnome tools
$DEFAULT_COMMAND gnome-tweak-tool
$DEFAULT_COMMAND gnome-system-tools
$DEFAULT_COMMAND gnome-shell-extensions

# ifconfig
$DEFAULT_COMMAND net-tools

# media pack
$DEFAULT_COMMAND ubuntu-restricted-extras

# gui firewall
$DEFAULT_COMMAND gufw

# xpad - like a windows's sticky notes
$DEFAULT_COMMAND xpad

# docker
$DEFAULT_COMMAND docker.io
sudo usermod -aG docker $USER

# paint - like a mspaint
$DEFAULT_COMMAND kolourpaint4

# file diff
$DEFAULT_COMMAND meld

# filezilla
$DEFAULT_COMMAND filezilla

# sublime-text
if [ ! -f `which subl` ]
then
	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
	$DEFAULT_COMMAND apt-transport-https
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
	$DEFAULT_COMMAND sublime-text
fi

# vscode
if [ ! -f `which code` ]
then
	wget -O vscode.deb https://go.microsoft.com/fwlink/?LinkID=760868
	sudo dpkg -i "$CURRENT_PATH/vscode.deb"
	$DEFAULT_COMMAND -f	
fi

# eclipse-photon
if [ ! -f "$CURRENT_PATH/eclipse-dsl-photon-R-linux-gtk-x86_64.tar.gz" ]
then 
	wget http://mirror.kakao.com/eclipse/technology/epp/downloads/release/photon/R/eclipse-dsl-photon-R-linux-gtk-x86_64.tar.gz
fi

# D2coding-font
if [ 0 -eq `fc-list | grep D2 | wc -l` ]
then
	wget -O D2coding.zip https://github.com/naver/d2codingfont/archive/master.zip
	unzip D2coding.zip
	FONT_TEMP_PATH="./d2codingfont-master"
	LATEST_FONT=$(ls $FONT_TEMP_PATH | grep D2Coding | sort -r | head -n 1)
	unzip $FONT_TEMP_PATH/$LATEST_FONT -d $FONT_TEMP_PATH
	chmod -R 755 $FONT_TEMP_PATH/*

	FONT_TARGET_PATH="/usr/share/fonts/truetype/D2Coding"
	sudo mkdir -p $FONT_TARGET_PATH
	sudo cp $FONT_TEMP_PATH/D2CodingAll/* $FONT_TARGET_PATH/
	sudo chown -R root:root $FONT_TARGET_PATH
	fc-cache -f
	rm -rf $FONT_TEMP_PATH
	rm -rf D2coding.zip
fi

# libreoffice
sudo add-apt-repository -y ppa:libreoffice/ppa
$DEFAULT_COMMAND libreoffice

# openjdk8
$DEFAULT_COMMAND 'openjdk-8*'

# utils
$DEFAULT_COMMAND htop
$DEFAULT_COMMAND tree
$DEFAULT_COMMAND openssh-server
$DEFAULT_COMMAND glances
$DEFAULT_COMMAND nmap
$DEFAULT_COMMAND googler

# git
if [ ! -f `which git` ]
then 
	$DEFAULT_COMMAND git
fi

# optimizer gui tool
if [ ! -f `which stacer` ]
then
	sudo add-apt-repository ppa:oguzhaninan/stacer
	$DEFAULT_COMMAND stacer
fi

# dock
$DEFAULT_COMMAND plank

# icon-theme
sudo add-apt-repository -y ppa:snwh/pulp
$DEFAULT_COMMAND paper-icon-theme

# theme
sudo add-apt-repository -y ppa:tista/adapta
$DEFAULT_COMMAND adapta-gtk-theme

# easy-ssh
if [ ! -d "$HOME/.easy-ssh" ]
then
	wget -O easy-ssh.zip https://github.com/sinuki/easy-ssh/archive/master.zip
	unzip easy-ssh.zip -d "$HOME/.easy-ssh"
	mv "$HOME/.easy-ssh/easy-ssh-master/easy-ssh" "$HOME/.easy-ssh/easy-ssh"
	rm -rf "$HOME/.easy-ssh/easy-ssh-master"
	rm -rf easy-ssh.zip
fi

# shell
$DEFAULT_COMMAND zsh

if [ "/usr/bin/zsh" != "$SHELL" ]
then
	chsh -s `which zsh`
fi

if [ ! -f "$HOME/.zshrc" ]
then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# terminator -like a mobaXTerm
$DEFAULT_COMMAND terminator

sudo apt update
