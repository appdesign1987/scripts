#!/usr/bin/env bash

cd /scripts && git pull origin
cd /scripts && chmod a+x *
cd /scripts && ./StartVesta.sh
