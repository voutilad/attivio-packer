#!/bin/bash -eux

# setup initial directories
sudo mkdir /opt/attivio
sudo chown vagrant /opt/attivio
sudo chgrp vagrant /opt/attivio

# download and install attivio
cd /opt/attivio
wget http://$FILEHOST/releases/v4.3.2/x64Linux/Installer/AIE-4.3.2.99510-lin64.sh.gz
wget http://$FILEHOST/releases/v4.3.2/x64Linux/Installer/do-not-distribute/attivio.license
gunzip AIE-4.3.2.99510-lin64.sh.gz
sh AIE-4.3.2.99510-lin64.sh -q -Vattivio.license.file=/opt/attivio/attivio.license
#yum install gtk+-devel gtk2-devel
