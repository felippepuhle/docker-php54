#!/bin/bash

sh docker-kill.sh

docker run -d \
    -p 80:80 \
    -h 'mydockerexample.com' \
    -v `pwd`/www:/var/www/html \
    -v `pwd`/vhosts:/etc/apache2/sites-enabled \
    --name mydockerexample.com \
    lippep/php54