#!/bin/bash

# Ubuntu 18.04LTS initial settings shell script
# 
# author : parksw
# since  : 2018.06.13

CURRENT_PATH=`pwd`

# remove default dock
sudo apt remove -y gnome-shell-extension-ubuntu-dock

# vim & config
sudo apt install -y vim
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
sudo apt install -y gnome-tweak-tool
sudo apt install -y gnome-system-tools
sudo apt install -y gnome-shell-extensions

# ifconfig
sudo apt install -y net-tools

# media pack
sudo apt install -y ubuntu-restricted-extras

# gui firewall
sudo apt install -y gufw

# xpad - like a windows's sticky notes
sudo apt install -y xpad

# docker
sudo apt install -y docker.io
sudo usermod -aG docker $USER

# paint - like a mspaint
sudo apt install -y kolourpaint4

# file diff
sudo apt install -y meld

# filezilla
sudo apt install -y filezilla

# sublime-text
if [ ! -f `which subl` ]
then
	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
	sudo apt install -y apt-transport-https
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
	sudo apt install -y sublime-text
fi

# vscode
if [ ! -f `which code` ]
then
	wget -O vscode.deb https://go.microsoft.com/fwlink/?LinkID=760868
	sudo dpkg -i "$CURRENT_PATH/vscode.deb"
	sudo apt install -f -y
fi

# eclipse-oxygen
if [ ! -f "$CURRENT_PATH/eclipse-jee-oxygen-3a-linux-gtk-x86_64.tar.gz" ]
then 
	wget http://mirror.kakao.com/eclipse/technology/epp/downloads/release/oxygen/3a/eclipse-jee-oxygen-3a-linux-gtk-x86_64.tar.gz
fi

# D2coding-font
if [ 0 -eq `fc-list | grep D2 | wc -l` ]
then
	wget -O D2coding.zip https://github.com/naver/d2codingfont/archive/master.zip
	unzip D2coding.zip
fi

# libreoffice
sudo add-apt-repository -y ppa:libreoffice/ppa
sudo apt install -y libreoffice

# oracle jdk
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt install -y oracle-java8-installer

# utils
sudo apt install -y htop
sudo apt install -y tree
sudo apt install -y openssh-server
sudo apt install -y git
sudo apt install -y glances

# dock
sudo apt install -y plank

# theme
sudo add-apt-repository -y ppa:snwh/pulp
sudo apt install -y paper-icon-theme

sudo add-apt-repository -y ppa:tista/adapta
sudo apt install -y adapta-gtk-theme

# easy-ssh
if [ ! -d "$HOME/.easy-ssh" ]
then
	mkdir "$HOME/.easy-ssh"
	wget -O easy-ssh.zip https://github.com/sinuki/easy-ssh/archive/master.zip
	unzip easy-ssh.zip
fi

# shell
sudo apt install -y zsh

if [ "/usr/bin/zsh" != "$SHELL" ]
then
	chsh -s `which zsh`
fi

if [ ! -f "$HOME/.zshrc" ]
then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

sudo apt update
