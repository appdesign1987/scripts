#!/usr/bin/env bash

#Git clone Phpmyadmin
cd /var/www && git clone --branch STABLE https://github.com/phpmyadmin/phpmyadmin.git

# Start apache
cd /etc/init.d/ && ./apache2 start

#ugly hack to make sure the script will not exit.
/sbin/my_init
