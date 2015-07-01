#!/bin/bash
echo "Copying init script..."
sudo cp ./aie-agent-daemon /etc/init.d/

sudo /sbin/chkconfig aie-agent-daemon on
verification=`sudo /sbin/chkconfig --list aie-agent-daemon`
columns=( $verification )

if [[ "${columns[0]}" == "aie-agent-daemon" &&
      "${columns[1]}" == "0:off" &&
      "${columns[2]}" == "1:off" &&
      "${columns[3]}" == "2:on" &&
      "${columns[4]}" == "3:on" &&
      "${columns[5]}" == "4:on" &&
      "${columns[6]}" == "5:on" &&
      "${columns[7]}" == "6:off" ]]
then
  echo "Daemon 'aie-agent-daemon' successfully registered with the system."
  exit 0;
else
  echo "ERROR: daemon 'aie-agent-daemon' unable to be registered with the system."
  exit 1;
fi
