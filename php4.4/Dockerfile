FROM debian/eol:etch


# Install for debug
RUN apt-get update && apt-get install -y wget telnet nano vim net-tools procps slocate && updatedb

# RUN  echo "deb http://archive.debian.org/ etch main" > /etc/apt/sources.list.d/archive.debian.org.list

# https://archive.debian.org/debian/pool/main/n/nginx/
# http://archive.debian.org/debian/pool/main/n/nginx/


# RUN apt-get install -y libpcre3-dev zlib1g-dev libssl-dev libxml2-dev 

# RUN apt-cache pkgnames | grep php4

RUN apt-get install -y nginx

RUN apt-get install -y php4 php4-cli php4-common php4-cgi php4-mysql php4-pgsql php4-sqlite php4-sqlite3 php4-mcrypt php4-gd php4-curl php4-pear 

RUN apt-get install -y nfs-common


# RUN apt-get install -y php5.6-mysql php5.6-pgsql php5.6-zip php5.6-yaml php5.6-xml php5.6-sqlite3  php5.6-soap php5.6-redis php5.6-oauth php5.6-mcrypt php5.6-mbstring php5.6-intl php5.6-imap php5.6-gd php5.6-curl


# Copy PHP files to the web directory
COPY index.php /var/www/html/index.php
COPY nginx.conf /etc/nginx/nginx.conf

RUN echo "expose_php = Off" >> /etc/php4/apache2/php.ini && \
    echo "expose_php = Off" >> /etc/php4/cgi/php.ini && \
    echo "expose_php = Off" >> /etc/php4/cli/php.ini


RUN mkdir -p /var/www/html/nfs && \
    chown www-data:www-data -R /var/www && \
    echo "10.190.1.30:/data/namespace1 /var/www/html/nfs nfs defaults,nolock,_netdev 0 0" >> /etc/fstab 
    #mount -a
#- for pod mount
#mount -o nolock  10.190.1.30:/data/namespace1 /var/www/html/nfs

# Expose port 80 for HTTP traffic
EXPOSE 80

# Start Nginx and PHP
CMD /etc/init.d/nginx start && /usr/bin/php4-cgi -b 9000



# docker build -t phpn-php4.4:0.0.1 .
# docker run -it -p 80:80 phpn-php4.4:0.0.1 /bin/bash




