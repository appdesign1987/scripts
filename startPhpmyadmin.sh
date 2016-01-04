#!/usr/bin/env bash

#Git clone Phpmyadmin
cd /tmp && git clone --branch STABLE https://github.com/phpmyadmin/phpmyadmin.git
cd /var/www/html && rm -Rf *
cd /tmp/phpmyadmin && mv * /var/www/html/

# Start apache
cd /etc/init.d/ && ./apache2 start

#ugly hack to make sure the script will not exit.
/sbin/my_init
