#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]
do
    sleep 1
done


# install openjdk 17
sudo apt update
sudo apt upgrade -y
sudo apt install openjdk-17-jre -y


# First, add the repository key to your system:

sudo wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key |sudo gpg --dearmor -o /usr/share/keyrings/jenkins.gpg


# The gpg --dearmor command is used to convert the key into a format 
# that apt recognizes.
# Next, let’s append the Debian package repository address to the 
# server’s sources.list:

sudo sh -c 'echo deb [signed-by=/usr/share/keyrings/jenkins.gpg] http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'


# run apt update so that apt will use the new repository
sudo apt update


# install jenkins

sudo apt install jenkins -y


# Start jenkins service

sudo systemctl start jenkins.service


# 
sudo ufw allow OpenSSH

# 
sudo ufw enable


# 
sudo ufw allow 8080
