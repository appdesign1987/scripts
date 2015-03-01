#!/usr/bin/env bash

docker pull redis
docker run --name redisserver -d redis
docker build -t jeroen/lamernewsapp .
docker run -d -P -p 0.0.0.0:80:4567 -i -t --name lamernews --link redisserver:redis jeroen/lamernewsapp
