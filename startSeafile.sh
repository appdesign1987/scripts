#!/usr/bin/env bash

#start Seafile and Seahub
cd /srv/seafile/seafile-server-latest/ && ./seahub.sh start-fastcgi
cd /srv/seafile/seafile-server-latest/ && ./seafile.sh start

#Start Apache
/usr/sbin/apache2 -D FOREGROUND
