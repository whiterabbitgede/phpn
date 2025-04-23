#!/bin/bash

# php4 -S 0.0.0.0:80 -t /var/www/html
# /usr/bin/php4 -S 0.0.0.0:9000 -t /var/www/html
/usr/bin/php4-cgi -S 0.0.0.0:9000 -t /var/www/html

wait
