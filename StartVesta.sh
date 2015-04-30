#!/usr/bin/env bash

apt-get update && apt-get upgrade -y
echo moving everything to persistent location
mv /usr/local/vesta /persistent
ln -s /persistent/vesta /usr/local/vesta

echo starting everything
cd /etc/init.d/ && ./vesta start
cd /etc/init.d/ && ./mysql start
cd /etc/init.d/ && ./nginx start
cd /etc/init.d/ && ./exim4 start
cd /etc/init.d/ && ./apache2 start
cd /etc/init.d/ && ./bind9 start
cd /etc/init.d/ && ./fail2ban start

#ugly hack to make sure the script will not exit.
/sbin/my_init
