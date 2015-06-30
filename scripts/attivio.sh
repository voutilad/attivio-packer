#!/bin/bash -eux

# setup initial directories
sudo mkdir /opt/attivio
sudo chwon vagrant /opt/attivio
sudo chgrp vagrant /opt/attivio

# download and install attivio
cd /opt/attivio
wget http://dev.corp.attivio.com/releases/v4.3.2/x64Linux/Installer/AIE-4.3.2.99510-lin64.sh.gz
wget http://dev.corp.attivio.com/releases/v4.3.2/x64Linux/Installer/do-not-distribute/attivio.license
