#!/usr/bin/env bash

rm -R /scripts
git pull origin
cd /scripts && chmod a+x *
cd /scripts && ./StartVesta.sh
