#!/usr/bin/env bash

#Git clone Wordpress
cd /var/www && git clone https://github.com/WordPress/WordPress.git .

# Start apache
/usr/sbin/apache2 -D FOREGROUND
