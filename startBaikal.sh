#!/usr/bin/env bash

#Wget Baikal
cd /var/www && wget http://baikal-server.com/get/baikal-regular-0.2.7.tgz

#Extract archive
cd /var/www/ && tar xzf baikal-regular-0.2.7.tgz

#mv extracted data from archived folder to root
cd /var/www/baikal-regular && mv -f * ../

#remove extracted directory
rm -R /var/www/baikal-regular
cd /var/www && rm baikal-regular-0.2.7.tgz

#remove default apache2 config
rm /etc/apache2/sites-enabled/000-default*
rm /etc/apache2/sites-available/000-default*

#Get apache config
cd /tmp && git clone https://github.com/appdesign1987/ApacheConfig.git

#Move ApacheConfig
cd /tmp/ApacheConfig && mv baikal /etc/apache2/sites-enabled/000-default

#Enable mod_rewrite
a2enmod rewrite

#Start Apache
/usr/sbin/apache2 -D FOREGROUND
