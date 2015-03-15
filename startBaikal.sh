#!/usr/bin/env bash

#Install necessary things
apt-get install curl

#Git clone Baikal
cd /var/www && git clone -b branch-2 https://github.com/netgusto/Baikal.git

#Install composer
cd /var/www/Baikal && curl -sS https://getcomposer.org/installer | php

#Initialize the application settings
cd /var/www/Baikal && cp app/config/defaults/data.parameters.dist.yml data/parameters.yml
cd /var/www/Baikal && cp app/config/defaults/data.environment.dist.yml data/environment.yml

#Install Baikal dependencies
cd /var/www/Baikal && composer install --optimize-autoloader

#Start application
cd /var/www/Baikal && php app/console server:run --env=prod
