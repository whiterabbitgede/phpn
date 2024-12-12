# FROM debian:12-slim
FROM nginx:1.22



# Install for debug
RUN apt-get update && apt-get install -y wget telnet nano vim net-tools procps mlocate && updatedb

RUN wget https://packages.sury.org/php/apt.gpg -O /usr/share/keyrings/deb.sury.org-php.gpg && \
    osname=`grep VERSION_CODENAME /etc/os-release | cut -d= -f2` && \
    echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ ${osname} main" > /etc/apt/sources.list.d/deb.sury.org.list

#/etc/php/7.3/fpm/pool.d/www.conf
RUN mkdir -p /run/php    

RUN apt-get update && \
    apt-get install -y php7.3-fpm && \
    updatedb && \
    sed -i 's/www-data/nginx/g' /etc/php/7.3/fpm/pool.d/www.conf

# RUN set -eux; apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false

RUN apt-get install -y php7.3-mysql php7.3-pgsql php7.3-zip php7.3-yaml php7.3-xml php7.3-sqlite3  php7.3-soap php7.3-redis php7.3-oauth php7.3-mcrypt php7.3-mbstring php7.3-intl php7.3-imap php7.3-gd php7.3-curl

# /bin/bash

# ENTRYPOINT ["docker-nginx-entrypoint"]

# STOPSIGNAL SIGQUIT

# Expose port 80
# EXPOSE 80

# Start Nginx and PHP-FPM
# CMD service nginx start
# CMD ["service nginx start"]
# CMD ["/bin/bash" "-c" "service nginx start"]
# CMD ["/bin/sh" "-c" "service nginx start && php-fpm"]

RUN mkdir -p /var/www/html && chown nginx:nginx -R /var/www

# Copy PHP files to the web directory
COPY index.php /var/www/html/index.php


# Copy Nginx configuration
#Bookworm
# COPY default.conf /etc/nginx/sites-available/default

#bullseye
COPY default.conf /etc/nginx/conf.d/default.conf


# Expose port 80 for HTTP traffic
EXPOSE 80

# Start Nginx in the foreground
# CMD ["nginx", "-g", "daemon off;"]

CMD service php7.3-fpm start && nginx -g 'daemon off;'


# docker build -t phpn-php7.3:0.0.1 .
# docker run -it -p 80:80 phpn-php7.3:0.0.1 /bin/bash
