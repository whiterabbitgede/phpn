FROM nginx:1.22

# Install for debug
RUN apt-get update && apt-get install -y wget telnet nano vim net-tools procps mlocate && updatedb

RUN wget https://packages.sury.org/php/apt.gpg -O /usr/share/keyrings/deb.sury.org-php.gpg && \
    osname=`grep VERSION_CODENAME /etc/os-release | cut -d= -f2` && \
    echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ ${osname} main" > /etc/apt/sources.list.d/deb.sury.org.list

#/etc/php/8.3/fpm/pool.d/www.conf
RUN mkdir -p /run/php    

RUN apt-get update && \
    apt-get install -y php8.3-fpm && \
    updatedb && \
    sed -i 's/www-data/nginx/g' /etc/php/8.3/fpm/pool.d/www.conf

# RUN set -eux; apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false

RUN apt-get install -y php8.3-mysql php8.3-pgsql php8.3-zip php8.3-yaml php8.3-xml php8.3-sqlite3  php8.3-soap php8.3-redis php8.3-oauth php8.3-mcrypt php8.3-mbstring php8.3-intl php8.3-imap php8.3-gd php8.3-curl

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
CMD service php8.3-fpm start && nginx -g 'daemon off;'


# docker build -t phpn-php8.3:0.0.1 .
# docker run -it -p 80:80 phpn-php8.3:0.0.1 /bin/bash
