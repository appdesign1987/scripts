#!/usr/bin/env bash

apt-get update && apt-get upgrade -y
echo moving everything to persistent location
#moving Vesta
mv /usr/local/vesta /persistent
rm -R /usr/local/vesta
ln -s /persistent/vesta /usr/local/vesta

#setting localip in Vesta
cd /usr/local/vesta/data/ips && mv * 127.0.0.1
cd /install && mkdir backup
cd /etc/apache2/conf.d/ && cp 1* /install/backup
cd /install/backup && mv 1* apache2.conf.back
cd /etc/nginx/conf.d/ && cp 1* /install/backup
cd /install/backup && mv 1* nginx.conf.back
cd /etc/apache2/conf.d && sed -i -- 's/172.*.*.*:80/127.0.0.1:80/g' *
cd /etc/nginx/conf.d && sed -i -- 's/172.*.*.*:80/127.0.0.1:80/g' *
#rm /etc/apache2/conf.d/1*
#rm /etc/nginx/conf.d/1*
#cp /usr/local/vesta/data/ips/127.0.0.1 /etc/apache2/conf.d/
#cp /usr/local/vesta/data/ips/127.0.0.1 /etc/nginx/conf.d/ 

#copy dovecot start/stop script
cd /scripts && cp dovecot /etc/init.d/
cd /etc/init.d/ && chmod a+x dovecot

#copy vsftpd start/stop script
cd /scripts && cp vsftpd /etc/init.d/
cd /etc/init.d/ && chmod a+x vsftpd

#moving /home
mv /home /persistent
rm -R /home
ln -s /persistent/home /home

#moving Mysql
mv /var/lib/mysql /persistent
rm -R /var/lib/mysql
ln -s /persistent/mysql /var/lib/mysql

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
cd /etc/init.d/ && ./dovecot start
cd /etc/init.d/ && ./vsftpd start

#copy passwd file every 60 seconds
while true; do
  cp -f /etc/passwd /persistent
  cp -f /etc/group /persistent
  sleep 60
done

#ugly hack to make sure the script will not exit.
/sbin/my_init
