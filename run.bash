#!/usr/bin/env bash

docker run \
    -d \
    -v /home/isvoboda/projects/demos/www-data/:/var/www/html:rw \
    -v /var/run/mysqld/mysqld.sock:/tmp/mysql.sock -p50042:80 \
    demos:1.0
