#!/usr/bin/env bash

#Git clone Wordpress
cd /var/www && git clone --branch stable https://github.com/phpmyadmin/phpmyadmin.git

# Start apache
/usr/sbin/apache2 -D FOREGROUND
