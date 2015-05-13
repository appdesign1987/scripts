#!/usr/bin/env bash

#update software to make sure we have al the newest things
echo updating everything
rm -R /var/lib/apt/lists/*
apt-get update
apt-get -y install ssh
apt-get -y upgrade

#set timezone
echo Europe/Berlin > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

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
cd /etc/apache2/conf.d && sed -i -- 's/172.*.*.*:80/127.0.0.1:80/g' * && sed -i -- 's/172.*.*.*:8443/127.0.0.1:8443/g' *
cd /etc/nginx/conf.d && sed -i -- 's/172.*.*.*:80 default;/80 default;/g' * && sed -i -- 's/172.*.*.*:8080/127.0.0.1:8080/g' *
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

#fix for vsftpd
cd /var/run && mkdir vsftpd && cd /var/run/vsftpd && mkdir empty

#moving roundcube config to be persistent when dockerfile is setup again
mv /etc/roundcube /persistent
rm -R /etc/roundcube
ln -s /persistent/roundcube /etc/roundcube

#moving apache2 config to be persistent when dockerfile is setup again
mv /etc/apache2 /persistent
rm -R /etc/apache2
ln -s /persistent/apache2 /etc/apache2

#moving /home
mv /home /persistent
rm -R /home
ln -s /persistent/home /home

#moving Exim
mv /etc/exim4 /persistent
rm -R /etc/exim4
ln -s /persistent/exim4 /etc/exim4

#moving Mysql config folder
mv /etc/mysql /persistent/mysql-config/
ln -s /persistent/mysql-config /etc/mysql

#moving php5 config folder
mv /etc/php5 /persistent
rm -R /etc/php5
ln -s /persistent/php5 /etc/php5

#moving Mysql data folder
mv /var/lib/mysql /persistent
rm -R /var/lib/mysql
ln -s /persistent/mysql /var/lib/mysql

#move passwd file
mv /persistent/passwd /etc

#move group file
mv /persistent/group /etc

#move shadow file
mv /persistent/shadow /etc

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
  cp -f /etc/shadow /persistent
  sleep 60
done

#ugly hack to make sure the script will not exit.
/sbin/my_init
