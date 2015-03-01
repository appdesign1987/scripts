#!/usr/bin/env bash

docker create -v /gems/lamernews/ --name gems-lamernews busybox:latest
docker create -v /app --name lamernewsdata busybox:latest
docker create -v /data --name redisdata busybox:latest
docker pull redis
docker run --name redisserver -volumes-from redisdata -d redis redis-server --appendonly yes
wget https://files.jeroenvd.nl/files/Dockerfiles/Dockerfile
docker build -t jeroen/lamernewsapp .
docker run --volumes-from gems-lamernews --volumes-from lamernewsdata -d -P -p 0.0.0.0:8080:4567 -i -t --name lamernews --link redisserver:redis jeroen/lamernewsapp
