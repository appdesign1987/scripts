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
mv /var/vmail /data/vmail
rm -R /var/vmail
ln -s /data/vmail /var/vmail
mv /var/lib/mysql /data/mysql
rm -R /var/lib/mysql
ln -s /data/mysql /var/lib/mysql
mv /backup /data/backup
rm -R /backup
ln -s /data/backup /backup
mv /etc/nginx/conf.d /data/nginx/conf.d
rm -R /etc/nginx/conf.d
ln -s /data/nginx/conf.d /etc/nginx/conf.d
mv /etc/pure-ftpd /data/pureftpd
rm -R /etc/pure-ftpd
ln -s /data/pureftpd /etc/pure-ftpd
mv /etc/ajenti /data/ajenti-config
rm -R /etc/ajenti
ln -s /data/ajenti-config /etc/ajenti
mv /etc/exim4 /data/exim4
rm -R /etc/exim4
ln -s /data/exim4 /etc/exim4
mv /srv /data/www
rm -R /srv
ln -s /data/www /srv

#php5-fpm starten we ook
cd /etc/init.d/ && ./php5-fpm start

#nginx deamon starten we ook
cd /etc/init.d/ && ./nginx start

#nginx deamon starten we ook
cd /etc/init.d/ && ./mysql start

#nginx deamon starten we ook
cd /etc/init.d/ && ./pure-ftpd start

#nginx deamon starten we ook
cd /etc/init.d/ && ./exim4 start

#En nu gaan we ajenti starten
/usr/bin/ajenti-panel -v
