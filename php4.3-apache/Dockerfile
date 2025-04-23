FROM debian/eol:sarge


# Install for debug
RUN apt-get update && apt-get install -y wget telnet nano vim net-tools procps slocate 

# RUN  echo "deb http://archive.debian.org/ sarge main" > /etc/apt/sources.list.d/archive.debian.org.list

# https://archive.debian.org/debian/pool/main/n/nginx/
# http://archive.debian.org/debian/pool/main/n/nginx/


# RUN apt-cache pkgnames | grep php4

RUN apt-get install -y php4 php4-mysql php4-pgsql php4-xml  php4-sqlite php4-mcrypt php4-imap php4-gd  php4-pear php4-cli php4-common php4-gd php4-curl php4-dev

# RUN apt-get install -y php5.6-mysql php5.6-pgsql php5.6-zip php5.6-yaml php5.6-xml php5.6-sqlite3  php5.6-soap php5.6-redis php5.6-oauth php5.6-mcrypt php5.6-mbstring php5.6-intl php5.6-imap php5.6-gd php5.6-curl

RUN apt-get install -y apache2 libapache2-mod-php4 && \
    a2enmod php4 && \
    mkdir -p /var/www/html/  && \
    echo "expose_php = Off" >> /etc/php4/apache2/php.ini


# Copy PHP files to the web directory
COPY index.php /var/www/html/index.php
COPY httpd.conf /etc/apache2/sites-available/default
COPY apache2.conf /etc/apache2/apache2.conf

# Expose port 80 for HTTP traffic
EXPOSE 80

# Start Apache in foreground mode
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]


# docker build -t phpn-php4.3:0.0.1 .
# docker run -it -p 80:80 phpn-php4.3:0.0.1 /bin/bash
