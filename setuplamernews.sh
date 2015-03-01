#!/usr/bin/env bash

docker pull redis
docker run --name redisserver -d redis
