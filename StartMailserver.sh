#!/usr/bin/env bash

#Start Postfix
/etc/init.d/postfix start
#StartDovecot
/etc/init.d/dovecot start

# Start apache
/usr/sbin/apache2 -D FOREGROUND
