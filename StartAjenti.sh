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

#En nu gaan we ajenti starten
cd /etc/init.d/ && ./ajenti stop
/usr/bin/ajenti-panel -v
