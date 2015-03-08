#!/usr/bin/env bash
#EDIT THE FOLLOWING OPTIONS ACCORDING THE RIGHT VERSION

#set version of seafile
export seafileversion=4.0.6

#set $directory
export directory=/srv/seafile/seafile-server-$seafileversion

#DO NOT TOUCH BELOW THIS LINE

#remove symlink
rm /srv/seafile/seafile-server-latest

#download latest seafile-server version
cd /tmp && wget https://bitbucket.org/haiwen/seafile/downloads/seafile-server_4.0.6_x86-64.tar.gz

#extract downloaded seafile-server-version
cd /tmp && tar zxvf seafile-server_*.tar.gz

#mv seafileserver version to installation folder
cd /tmp && mv seafile-server-$seafileversion /srv/seafile/

#create symlink
ln -s /srv/seafile/seafile-server-latest /srv/seafile/seafile-server-$seafileversion
