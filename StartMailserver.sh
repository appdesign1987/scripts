#!/usr/bin/env bash

#Start Postfix
/etc/init.d/postfix start
#StartDovecot
/etc/init.d/dovecot start

#get VMadmin
cd /var/www && git clone git://github.com/opensolutions/ViMbAdmin.git
cd /var/www/ViMbAdmin && mv -f * ../

#Set folder rights once more
cd /var/ && chown -R www-data:www-data www

# Start apache
/usr/sbin/apache2 -D FOREGROUND
