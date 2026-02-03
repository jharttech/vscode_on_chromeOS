#!/bin/bash
#########################
#20260203 Script to install and setup vscode on ChromeOS
#########################


# Install needed apt packages
echo "Now going to upgrade packages and install needed packages"
sleep 3
sudo apt update && apt upgrade
sudo apt install libnspr4 libnss3 -y

#Install needed snap packages
echo "Now going to install needed snap packages"
sleep 3

sudo snap install core notepad-plus-plus

#Download the needed deb file
echo "Now going to download the latest Linux x64 stable build deb file"
sleep 3
wget 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64' -O code_amd64.deb

sleep 5

kill -9 $PPID
