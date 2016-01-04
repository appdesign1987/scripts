#!/bin/bash

#Git clone Apacheconfig
cd /tmp && rm -Rf ApacheConfig
cd /tmp && git clone https://github.com/appdesign1987/ApacheConfig.git
cd /tmp/ApacheConfig/ && mv *.conf /etc/apache2/sites-enabled/
cd /etc/apache2/ && rm ports.conf
cd /etc/apache2/sites-enabled/ && mv ports.conf ../

# Start apache
cd /etc/init.d/ && ./apache2 restart

#ugly hack to make sure the script will not exit.
/sbin/my_init
