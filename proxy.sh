#!/bin/bash

#Git clone Apacheconfig
cd /tmp && git clone https://github.com/appdesign1987/ApacheConfig.git
cd /tmp/ApacheConfig/ && mv *.conf /etc/apache2/sites-enabled/

# Start apache
apachtctl start


