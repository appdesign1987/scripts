#!/usr/bin/env bash

if [ -d "/srv/seafile/seafile-server-4.0.6" ]; then
#start Seafile and Seahub
cd /srv/seafile/seafile-server-latest/ && ./seahub.sh start-fastcgi
cd /srv/seafile/seafile-server-latest/ && ./seafile.sh start

#Start Apache
/usr/sbin/apache2 -D FOREGROUND

fi

# Download new seafile-version
cd /tmp && wget https://bitbucket.org/haiwen/seafile/downloads/seafile-server_4.0.6_x86-64.tar.gz

#Extract downloaded version
cd /tmp && tar zxvf seafile-server*.tar.gz

#mkdir Seafile folder 
mkdir /srv/seafile/

#move extracted files to Seafile folder
cd /tmp && mv seafile-server* /srv/seafile/

#Create symlink to new latest seafile-server
ln -s /srv/seafile/seafile-server-4.0.6 /srv/seafile/seafile-server-latest


