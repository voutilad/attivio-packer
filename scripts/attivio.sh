#!/bin/bash -eux

# download and install attivio
cd /opt/attivio
# cp /home/vagrant/download.py .

# python download.py $ATTIVIO_VERSION installer
# python download.py $ATTIVIO_VERSION license
# python download.py $ATTIVIO_VERSION sqlsdk
cp installer/*.sh .
cp installer/*.gz .


gunzip `ls *.gz | awk {'print $1'}`
sh `ls AIE-*.sh | awk {'print $1'}` -q -Vattivio.license.file=/opt/attivio/attivio.license
mkdir modules temp
mv *.tar temp
cd temp
tar xvf *.tar
mv *.tar ../modules
#assuming attivio installs in ../aie-...
cp -Rf * ../aie*
cd ..
rm -Rf temp


# just to be safe, make sure we change ownership etc
sudo chown -R vagrant /opt/attivio
sudo chgrp -R vagrant /opt/attivio


# to pass linux checker (what's not included in the kickstart config)
#sudo yum install -y `yum list available | grep 'font.*noarch' | awk {'print $1'}`
sudo yum install -y `yum list available | grep libstdc+ | awk {'print $1'}`


echo "export LANG=en_US.UTF-8" >> /home/vagrant/.bashrc
echo "export LANGUAGE=en_US.UTF-8" >> /home/vagrant/.bashrc
echo "export LC_COLLATE=C" >> /home/vagrant/.bashrc
echo "export LC_CTYPE=en_US.UTF-8" >> /home/vagrant/.bashrc
sudo echo LC_CTYPE=\"en_US.UTF-8\" >> /etc/sysconfig/i18n
