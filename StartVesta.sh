#!/usr/bin/env bash

apt-get update && apt-get upgrade -y
mv /usr/local/vesta /persistent
ln -s /persistent/vesta /usr/local/vesta

cd /etc/init.d/ && ./vesta start
cd /etc/init.d/ && ./mysql start
cd /etc/init.d/ && ./nginx start
cd /etc/init.d/ && ./exim4 start
cd /etc/init.d/ && ./apache2 start
cd /etc/init.d/ && ./bind9 start
cd /etc/init.d/ && ./fail2ban start
