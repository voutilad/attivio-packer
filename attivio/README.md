# Attivio 4 Demonizer

Based on the Makeself installer, this helps us wire up the sysv init scripts for
running the Attivio agent in CentOS.

If you want to make changes, make sure grab the latest
[Makeself](http://stephanepeter.com/makeself/) and try doing:

````
 ./makeself.sh ~/src/packer-centos-6/attivio \
  demonize.sh "Attivio 4 Demonizer" demonize.sh
````
