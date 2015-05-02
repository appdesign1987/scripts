#!/usr/bin/env bash

apt-get update && apt-get upgrade -y
echo moving everything to persistent location
#moving Vesta
mv /usr/local/vesta /persistent
rm -R /usr/local/vesta
ln -s /persistent/vesta /usr/local/vesta

#moving /home
mv /home /persistent
rm -R /home
ln -s /persistent/home /home

#moving Mysql
mv /var/lib/mysql /persistent
rm -R /var/lib/mysql
ln -s /persistent/mysql /var/lib/mysql

#copy passwd file every 60 seconds
while true; do
  cp -f /etc/passwd /persistent
  cp -f /etc/group /persistent
  sleep 60
done

#move passwd file
rm /etc/passwd
mv /persistent/passwd /etc

#move group file
rm /etc/group
mv /persistent/group /etc

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
