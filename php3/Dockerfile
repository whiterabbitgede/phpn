FROM nginx:1.22

# Install for debug
RUN apt-get update  && \
    apt-get install -y wget telnet nano vim net-tools procps mlocate  && \
    updatedb 
# RUN apt-get install -y iputils-ping # for ping
# RUN apt-get install -y dnsutils # for nslookup


RUN apt-get install -y wget build-essential \
    libxml2-dev libgd-dev \
    libpng-dev libjpeg-dev libfreetype6-dev \
    bison flex \
    fcgiwrap spawn-fcgi
    
COPY php-3.0.18.tar.gz /tmp/
# RUN wget https://museum.php.net/php3/php-3.0.18.tar.gz && \
RUN cd /tmp && \
    tar -xzf php-3.0.18.tar.gz && \
    cd php-3.0.18 && \
    # ./configure --enable-cgi --with-mysql --with-apxs=/usr/bin/apxs && \
    # ./configure --enable-cgi && \
    ./configure --enable-cgi --enable-force-cgi-redirect && \
    make && \
    make install && \
    mkdir -p /usr/lib/cgi-bin && \
    cp /usr/local/bin/php /usr/lib/cgi-bin/php3

# for nginx conf
RUN mkdir -p /var/cache/nginx/client_temp && \
    chown nginx:nginx -R /var/cache/  && \
    mkdir -p /run/php/  && \
    chown nginx:nginx -R /var/run && \
    chown nginx:nginx -R /run && \
    chown nginx:nginx /var/log  && \
    mkdir -p /var/www/html  && \
    chown nginx:nginx -R /var/www 


COPY nginx.conf /etc/nginx/nginx.conf 
COPY default.conf /etc/nginx/conf.d/default.conf 
COPY --chmod=755 php3-wrapper.sh /usr/lib/cgi-bin/php3-wrapper.sh
COPY --chown=nginx:nginx --chmod=775 index.php /var/www/html/index.php
COPY --chown=nginx:nginx --chmod=775 test.php3 /var/www/html/test.php3
COPY --chown=nginx:nginx --chmod=775 test.php3 /var/www/html/test.php

#USER nginx

EXPOSE 80

#CMD nginx -g 'daemon off;' 
CMD /usr/lib/cgi-bin/php3-wrapper.sh && nginx -g 'daemon off;'


# docker build -t phpn-php3.0:0.0.1 .
# docker run -it -p 80:80 phpn-php3.0:0.0.1 /bin/bash
