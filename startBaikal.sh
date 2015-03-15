#!/usr/bin/env bash

#Git clone Baikal
cd /var/www && wget http://baikal-server.com/get/baikal-regular-0.2.7.tgz

#Extract archive
cd /var/www/ && tar xzf baikal-0.2.7.tgz

#mv extracted data from archived folder to root
cd /var/www/baikal-0.2.7 && mv -Rf * ../


