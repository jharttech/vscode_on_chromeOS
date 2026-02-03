#!/bin/bash
#########################
#20260203 Script to install and setup vscode on ChromeOS
#########################


# Install needed apt packages
echo "Now going to upgrade packages and install needed packages"
sleep 3
sudo apt update && sudo apt upgrade -y
sudo apt install libnspr4 libnss3 -y

#Download the needed deb file
echo "Now going to download the latest Linux x64 stable build deb file"
sleep 3
wget 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64' -O code_amd64.deb
sleep 2

echo "Now going to install vscode from the deb file"
sleep 3
sudo dpkg -i code_amd64.deb
sleep 2

#Check to see if the installation of vscode was successfull or if there were errors
package_name="code"
status=$(sudo dpkg-query -W -f='${Status}' "$package_name" 2>/dev/null)
if [[ "$status" == "install ok installed" ]]; then
    echo "VSCode was fully installed and ready to launch from the app drawer."
    sleep 5
    rm code_amd64.deb
    sleep 1
    rm ./install.sh
    sleep 2
    kill -9 $PPID
else
    echo "VSCode install issue detected.  Current status: $status"
    sleep 3
    echo "Correct the issues above and run the install.sh script again.  Script closing at this time!!"
    sleep 5
    exit
fi

