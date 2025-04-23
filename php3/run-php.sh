#!/bin/bash

# php3 -S 0.0.0.0:80 -t /var/www/html
# /usr/bin/php3 -S 0.0.0.0:9000 -t /var/www/html
/usr/lib/cgi-bin/php3  -S 0.0.0.0:9000 -t /var/www/html

wait
