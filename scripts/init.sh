#!/bin/bash -eux

# wget install
sudo yum install wget -y

# X11
#yum groupinstall "X Window System" "Desktop" "Desktop Platform" -y
#yum install gdm -y
yum install xauth -y
