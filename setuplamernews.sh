#!/usr/bin/env bash

#stopping al docker images
echo stopping al docker images
sudo docker stop redisserver
sudo docker stop lamernews
sudo docker stop lamernewsdata


#removing old images
echo removing old docker containers
sudo docker rm gems-lamernews
sudo docker rm lamernewsdata
sudo docker rm redisdata
sudo docker rm redisserver
sudo docker rm lamernews

echo setting up everything
sudo docker create -v /gems/lamernews/ --name gems-lamernews busybox:latest
sudo docker create -v /app/data --name lamernewsdata busybox:latest
sudo docker create -v /data/ --name redisdata busybox:latest
echo sudo docker pull redis
sudo docker pull redis
echo sudo docker run --name redisserver --volumes-from redisdata -d redis redis-server --appendonly yes
sudo docker run --name redisserver --volumes-from redisdata -d redis redis-server --appendonly yes
echo wget http://files.jeroenvd.nl/files/Dockerfiles/Dockerfile
wget http://files.jeroenvd.nl/files/Dockerfiles/Dockerfile
echo sudo docker build --no-cache -t jeroen/lamernewsapp .
sudo docker build --no-cache -t jeroen/lamernewsapp .
echo sudo docker run --volumes-from gems-lamernews --volumes-from lamernewsdata -d -P -p 0.0.0.0:8080:4567 -i -t --name lamernews --link redisserver:redis jeroen/lamernewsapp
sudo docker run --volumes-from gems-lamernews --volumes-from lamernewsdata -d -P -p 0.0.0.0:8080:4567 -i -t --name lamernews --link redisserver:redis jeroen/lamernewsapp
echo                              *************************************************************************************************************************************                                                                                                                                   *  
echo                              *                                                                                                                                   *
echo                              *                                                                                                                                   *
echo                              *                                                                                                                                   *
echo                              *                       Dit script is klaar met draaien. De lamernews app kan nu worden gestart via HOSTIP:8080                     *                                                       
echo                              *                       Door het script nogmaals uit te voeren zal alle data worden verwijderd zodat opnieuw kan worden begonnen    *
echo                              *                                                                                                                                   *
echo                              *                                                                                                                                   *
echo                              *                                                                                                                                   *
echo                              *                                                                                                                                   *
echo                              *                                                                                                                                   *
echo                              *************************************************************************************************************************************
