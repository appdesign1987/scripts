#!/usr/bin/env bash

rm -R /scripts
cd / && git clone https://github.com/appdesign1987/scripts.git
cd /scripts && chmod a+x *
cd /scripts && ./StartVesta.sh
