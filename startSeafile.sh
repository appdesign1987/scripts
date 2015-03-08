#!/usr/bin/env bash

if [ -d "$DIRECTORY" ]; then

#Start seafile
cd /srv/seafile/seafile-server-latest && ./seafile.sh start
cd /srv/seafile/seafile-server-latest && ./seahub.sh start-fastcgi

#start apache

fi


#download setup file
cd /tmp && wget http://files.jeroenvd.nl/files/scripts/setupseafile.sh
#set execute script
chmod +x /tmp/setupseafile.sh
#start setup script
cd /tmp && ./setupseafile.sh
