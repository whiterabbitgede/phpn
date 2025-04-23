#!/bin/sh
# exec /usr/lib/cgi-bin/php3

spawn-fcgi -s /run/fcgiwrap.socket -U nginx -G nginx -- /usr/sbin/fcgiwrap
# spawn-fcgi -s /run/fcgiwrap.socket -U nginx -G nginx -n -- /usr/sbin/fcgiwrap

# SCRIPT_FILENAME=/var/www/html/test.php REQUEST_METHOD=GET REDIRECT_STATUS=200 spawn-fcgi -s /run/php/php-cgi.sock -u nginx -g nginx -f /usr/lib/cgi-bin/php3 -n

# spawn-fcgi -p 9000 -n /usr/lib/cgi-bin/php3-wrapper.sh
# spawn-fcgi -s /run/php/php-cgi.sock -u nginx -g nginx -C 5 -- /usr/lib/cgi-bin/php3 

# (-n = no daemon mode for debugging)




# cgi-fcgi -bind -connect /run/fcgiwrap.socket  <<EOF
# BEGIN_REQUEST
# SCRIPT_FILENAME=/var/www/html/test.php
# REQUEST_METHOD=GET
# REDIRECT_STATUS=200
# EOF