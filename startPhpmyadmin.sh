#!/usr/bin/env bash

#Git clone Phpmyadmin
cd /var/www && git clone --branch STABLE https://github.com/phpmyadmin/phpmyadmin.git

# Start apache
apachectl start
