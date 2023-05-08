#!/bin/bash

# System specific configurations by oduudo

echo $HOSTNAME

if [ "$HOSTNAME" = UdosDS1823 ] || [ "$HOSTNAME" = UdosDS1019 ]; then
    echo $HOSTNAME
    PATH=$PATH:/usr/local/mariadb10/bin
    alias cdmycnf="cd /var/packages/MariaDB10/etc"
    alias mysqltuner="perl mysqltuner.pl"
    alias restMaria="sudo /usr/syno/bin/synopkg restart MariaDB"
fi

if [ "$HOSTNAME" = erriapus.uberspace.de ]; then
    echo $HOSTNAME
fi

# sudo nano my.cnf
# scp root@192.168.1.12:/var/lib/disk-compatibility/*.* c:\users\udoja\syno_compatibility
#
# if fhem

