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

#install ajenti


#fix to get pure-ftpd working

# install package building helpers
apt-get -y --force-yes install dpkg-dev debhelper

# install dependancies
apt-get -y build-dep pure-ftpd

# build from source
mkdir /tmp/pure-ftpd/ && \
    cd /tmp/pure-ftpd/ && \
    apt-get source pure-ftpd && \
    cd pure-ftpd-* && \
    sed -i '/^optflags=/ s/$/ --without-capabilities/g' ./debian/rules && \
    dpkg-buildpackage -b -uc
    
# install the new deb files
dpkg -i /tmp/pure-ftpd/pure-ftpd-common*.deb
apt-get -y install openbsd-inetd
dpkg -i /tmp/pure-ftpd/pure-ftpd_*.deb

# Prevent pure-ftpd upgrading
apt-mark hold pure-ftpd pure-ftpd-common

#install Ajenti the control panel
apt-get -y install ajenti-v ajenti-v-mail ajenti-v-ftp-pureftpd ajenti-v-php-fpm ajenti-v-nginx ajenti-v-mysql

#En nu gaan we ajenti starten
/usr/bin/ajenti-panel -v
