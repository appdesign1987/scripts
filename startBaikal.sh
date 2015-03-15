#!/usr/bin/env bash

#Wget Baikal
cd /var/www && wget http://baikal-server.com/get/baikal-regular-0.2.7.tgz

#Extract archive
cd /var/www/ && tar xzf baikal-regular-0.2.7.tgz

#mv extracted data from archived folder to root
cd /var/www/baikal-0.2.7 && mv -Rf * ../

#remove extracted directory
rm -R /var/www/baikal-0.2.7

#remove default apache2 config
rm /etc/apache2/sites-enabled/default*
rm /etc/apache2/sites-available/default*

#Get apache config
cd /tmp && git clone https://github.com/appdesign1987/ApacheConfig.git

#Move ApacheConfig
cd /tmp/ApacheConfig && mv baikal /etc/apache2/sites-available/

#Start Apache
/usr/sbin/apache2 -D FOREGROUND
