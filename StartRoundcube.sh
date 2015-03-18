#!/usr/bin/env bash

#get roundcube
cd /var/www && wget http://downloads.sourceforge.net/project/roundcubemail/roundcubemail/1.1.0/roundcubemail-1.1.0-complete.tar.gz
cd /var/www && tar zxvf roundcubemail-1.1.0-complete.tar.gz
cd /var/www/roundcubemail-1.1.0 && mv -f * ../
cd /var/www && rm -R roundcubemail-1.1.0
cd /var/www && rm roundcubemail-1.1.0-complete.tar.gz

# Start apache
/usr/sbin/apache2 -D FOREGROUND
