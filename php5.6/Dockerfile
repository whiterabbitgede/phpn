FROM nginx:1.22

# Install for debug
RUN apt-get update  && \
    apt-get install -y wget telnet nano vim net-tools procps mlocate  && \
    updatedb 

RUN wget https://packages.sury.org/php/apt.gpg -O /usr/share/keyrings/deb.sury.org-php.gpg  && \
    osname=`grep VERSION_CODENAME /etc/os-release | cut -d= -f2`  && \
    echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ ${osname} main" > /etc/apt/sources.list.d/deb.sury.org.list 

RUN apt-get update  && \
    apt-get install -y php5.6-fpm  && \
    updatedb 

RUN apt-get install -y php5.6-mysql php5.6-pgsql php5.6-zip php5.6-yaml php5.6-xml php5.6-sqlite3 php5.6-soap php5.6-redis php5.6-oauth php5.6-mcrypt php5.6-mbstring php5.6-intl php5.6-imap php5.6-gd php5.6-curl 

RUN sed -i 's/www-data/nginx/g' /etc/php/5.6/fpm/pool.d/www.conf  && \
    sed -i 's/;listen.mode/listen.mode/g' /etc/php/5.6/fpm/pool.d/www.conf 

RUN sed -i 's/--nodaemonize/--allow-to-run-as-root --nodaemonize/g' /lib/systemd/system/php5.6-fpm.service 

RUN mkdir -p /var/cache/nginx/client_temp && \
    chown nginx:nginx -R /var/cache/  && \
    mkdir -p /run/php/  && \
    chown nginx:nginx -R /var/run && \
    chown nginx:nginx -R /run && \
    chown nginx:nginx /lib/systemd/system/php5.6-fpm.service  && \
    chown nginx:nginx /etc/systemd/system/multi-user.target.wants/php5.6-fpm.service  && \
    chown nginx:nginx /usr/sbin/php-fpm5.6  && \
    chown nginx:nginx /etc/php/5.6/fpm/php-fpm.conf  && \
    chown nginx:nginx -R /etc/php/5.6/  && \
    chown nginx:nginx /var/log  && \
    chown nginx:nginx /usr/lib/php/php-fpm-socket-helper  && \
    mkdir -p /var/www/html  && \
    chown nginx:nginx -R /var/www 

COPY index.php /var/www/html/index.php 

COPY nginx.conf /etc/nginx/nginx.conf 

COPY default.conf /etc/nginx/conf.d/default.conf 

USER nginx

EXPOSE 80

CMD /usr/sbin/php-fpm5.6 --fpm-config /etc/php/5.6/fpm/php-fpm.conf && nginx -g 'daemon off;' 

# CMD ["/bin/sh" "-c" "/usr/sbin/php-fpm5.6 --fpm-config /etc/php/5.6/fpm/php-fpm.conf  && nginx -g 'daemon off;'"]
# CMD /usr/sbin/php-fpm5.6 --fpm-config /etc/php/5.6/fpm/php-fpm.conf && nginx -g 'daemon off;' 
# CMD service php5.6-fpm start  && nginx -g 'daemon off;'


# docker build -t phpn-php5.6:0.0.3 .
# docker run -it -p 80:80 phpn-php5.6:0.0.1 /bin/bash
