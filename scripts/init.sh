#!/bin/bash -eux

# wget install
#sudo yum install wget -y

# X11
#yum groupinstall "X Window System" "Desktop" "Desktop Platform" -y
#yum install gdm -y
#yum install xauth -y

### FROM: https://github.com/gwagner/packer-centos/blob/master/provisioners/install-virtualbox-guest-additions.sh
# Mount the disk image
cd /tmp
mkdir /tmp/isomount
mount -t iso9660 -o loop /root/VBoxGuestAdditions.iso /tmp/isomount

# Install the drivers
/tmp/isomount/VBoxLinuxAdditions.run

# Cleanup
umount isomount
rm -rf isomount /root/VBoxGuestAdditions.iso
###
