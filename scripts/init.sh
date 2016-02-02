#!/bin/bash -eux

### FROM: https://github.com/gwagner/packer-centos/blob/master/provisioners/install-virtualbox-guest-additions.sh
# Mount the disk image
cd /tmp
sudo mkdir /tmp/isomount
sudo mount -t iso9660 -o loop /home/vagrant/VBoxGuestAdditions.iso /tmp/isomount

# Install the drivers
sudo /tmp/isomount/VBoxLinuxAdditions.run

# Cleanup
sudo umount isomount
sudo rm -rf isomount /home/vagrant/VBoxGuestAdditions.iso
###


### Python 2.x pip - from https://www.digitalocean.com/community/tutorials/how-to-set-up-python-2-7-6-and-3-3-3-on-centos-6-4
# Let's download the installation file using wget:
# wget --no-check-certificate https://pypi.python.org/packages/source/s/setuptools/setuptools-1.4.2.tar.gz

# Extract the files from the archive:
# tar -xvf setuptools-1.4.2.tar.gz

# Enter the extracted directory:
# cd setuptools-1.4.2

# Install setuptools using the Python we've installed (2.7.6)
# sudo python setup.py install

# pip
# curl https://raw.githubusercontent.com/pypa/pip/master/contrib/get-pip.py | sudo python -

#python deps
# sudo pip install requests
