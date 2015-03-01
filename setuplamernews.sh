#!/usr/bin/env bash

docker pull redis
docker run --name redisserver -d redis
docker create -v /gems/lamernews/ --name gems-lamernews busybox:latest
docker create -v /app --name lamernewsdata busybox:latest
docker build -t jeroen/lamernewsapp .
docker run --volumes-from gems-lamernews --volumes-from lamernewsdata -d -P -p 0.0.0.0:80:4567 -i -t --name lamernews --link redisserver:redis jeroen/lamernewsapp
