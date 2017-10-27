#!/usr/bin/env sh

deluser 1001 > /dev/null 2>&1
adduser -u 1001 -D -s /bin/sh 1001

if [ ! -d /app ]
then
    mkdir /app
fi

chown -f 1001 /app
cd /app

SAVE_IFS=$IFS
export IFS=' '

su - 1001 -c "cd /app; git $*"