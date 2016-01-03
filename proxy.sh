#!/bin/bash

#Git clone Apacheconfig
cd /tmp && git clone https://github.com/WordPress/WordPress.git

# Start apache
/usr/sbin/apache2 -D FOREGROUND
