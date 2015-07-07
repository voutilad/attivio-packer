#!/bin/bash -eux

# setup initial directories
sudo mkdir /opt/attivio
sudo chown vagrant /opt/attivio
sudo chgrp vagrant /opt/attivio

# download and install attivio
cd /opt/attivio
cp /home/vagrant/download.py .

python download.py $ATTIVIO_VERSION installer
python download.py $ATTIVIO_VERSION license
python download.py $ATTIVIO_VERSION sqlsdk
#wget http://$FILEHOST/releases/v4.3.2/x64Linux/Installer/AIE-4.3.2.99510-lin64.sh.gz
#wget http://$FILEHOST/releases/v4.3.2/x64Linux/Installer/do-not-distribute/attivio.license
gunzip `ls AIE-$ATTIVIO_VERSION*-lin64.sh.gz | awk {'print $1'}`
sh `ls AIE-$ATTIVIO_VERSION*-lin64.sh.gz | awk {'print $1'}` -q -Vattivio.license.file=/opt/attivio/attivio.license

# make sure we change ownership etc
sudo chown -R vagrant /opt/attivio
sudo chgrp -R vagrant /opt/attivio


# to pass linux checker (what's not included in the kickstart config)
#sudo yum install -y `yum list available | grep 'font.*noarch' | awk {'print $1'}`
sudo yum install -y `yum list available | grep libstdc+ | awk {'print $1'}`


echo "export LANG=en_US.UTF-8" >> /home/vagrant/.bashrc
echo "export LANGUAGE=en_US.UTF-8" >> /home/vagrant/.bashrc
echo "export LC_COLLATE=C" >> /home/vagrant/.bashrc
echo "export LC_CTYPE=en_US.UTF-8" >> /home/vagrant/.bashrc
