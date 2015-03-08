#!/usr/bin/env bash

#download setup file
cd /tmp && wget http://files.jeroenvd.nl/files/scripts/setupseafile.sh
#set execute script
chmod +x /tmp/setupseafile.sh
#start setup script
cd /tmp && ./setupseafile.sh
