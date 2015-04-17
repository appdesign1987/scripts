#!/usr/bin/env bash

#Om de data te bewaren hebben we de volgende volumes gemount 
# /var/vmail
# /srv/
# /var/lib/mysql
# /backup
# /etc/nginx
# /etc/pure-ftpd
#/etc/ajenti
#Daarnaast willen we altijd up-to-date zijn dus gaan we nu eerst alles updaten en daarna installeren.
apt-get update
apt-get -y upgrade

#creating symlinks and moving folder to keep everything persistent
#mv /var/vmail /data/vmail
#ln -s /data/vmail /var/vmail
#mv /var/lib/mysql /data/mysql
#ln -s /data/mysql /var/lib/mysql
#mv /backup /data/backup
#ln -s /data/backup /backup
#mv /etc/nginx /data/nginx
#ln -s /data/nginx /etc/nginx
#mv /etc/pure-ftpd /data/pureftpd
#ln -s /data/pureftpd /etc/pure-ftpd
#mv /etc/ajenti /data/ajenti-config
#ln -s /data/ajenti-config /etc/ajenti



#En nu gaan we ajenti starten
cd /etc/init.d/ && ./ajenti stop
/usr/bin/ajenti-panel -v
