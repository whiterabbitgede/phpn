#FROM debian/eol:sarge
FROM debian:oldstable
# Debian GNU/Linux 11 (bullseye)

# Install for debug
RUN apt-get update && apt-get install -y wget telnet nano vim net-tools procps mlocate 

# RUN  echo "deb http://archive.debian.org/ etch main" > /etc/apt/sources.list.d/archive.debian.org.list

# https://archive.debian.org/debian/pool/main/n/nginx/
# http://archive.debian.org/debian/pool/main/n/nginx/
# https://snapshot.debian.org/archive/debian/20050312T000000Z/pool/main/p/php3/


# RUN apt-cache pkgnames | grep php3

RUN apt-get install -y wget build-essential apache2 apache2-dev \
    libxml2-dev libgd-dev \
    libpng-dev libjpeg-dev libfreetype6-dev \
    bison flex
    
COPY php-3.0.18.tar.gz /tmp/

# RUN wget https://museum.php.net/php3/php-3.0.18.tar.gz && \
RUN cd /tmp && \
    tar -xzf php-3.0.18.tar.gz && \
    cd php-3.0.18 && \
    # ./configure --enable-cgi --with-mysql --with-apxs=/usr/bin/apxs && \
    # ./configure --enable-cgi && \
    ./configure --enable-force-cgi-redirect && \
    make && \
    make install && \
    cp /usr/local/bin/php /usr/lib/cgi-bin/php3
    

COPY apache2.conf /etc/apache2/apache2.conf
COPY default.conf /etc/apache2/sites-available/000-default.conf
COPY --chown=www-data:www-data --chmod=775 index.php /var/www/html/index.php
COPY --chown=www-data:www-data --chmod=775 test.php3 /var/www/html/test.php3
COPY --chown=www-data:www-data --chmod=775 test.php3 /var/www/html/test.php

RUN a2enmod cgi && \
    a2enmod actions

# Expose port 80 for HTTP traffic
EXPOSE 80

# Start Apache and PHP
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
# CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
# CMD /usr/sbin/apache
# CMD /etc/init.d/apache start
# CMD service apache2 start
# CMD /usr/sbin/apachectl start
# CMD /usr/sbin/apache2ctl start
# CMD apache2ctl -D FOREGROUND

# docker build -t phpa-php3.0:0.0.1 .
# docker run -it -p 80:80 phpa-php3.0:0.0.1 /bin/bash




