#!/usr/bin/env bash

#stopping al docker images
sudo docker stop redisserver
sudo docker stop lamernews

#removing old images
echo removing old docker containers
sudo docker rm gems-lamernews
sudo docker rm lamernewsdata
sudo docker rm redisdata
sudo docker rm redisserver

sudo docker create -v /gems/lamernews/ --name gems-lamernews busybox:latest
sudo docker create -v /app --name lamernewsdata busybox:latest
sudo docker create -v /data --name redisdata busybox:latest
sudo docker pull redis
sudo docker run --name redisserver -volumes-from redisdata -d redis redis-server --appendonly yes
wget http://files.jeroenvd.nl/files/Dockerfiles/Dockerfile
sudo docker build -t jeroen/lamernewsapp .
sudo docker run --volumes-from gems-lamernews --volumes-from lamernewsdata -d -P -p 0.0.0.0:8080:4567 -i -t --name lamernews --link redisserver:redis jeroen/lamernewsapp
