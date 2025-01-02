FROM nginx:1.22

# Install for debug
RUN apt-get update  && \
    apt-get install -y wget telnet nano vim net-tools procps mlocate  && \
    updatedb 

RUN wget https://packages.sury.org/php/apt.gpg -O /usr/share/keyrings/deb.sury.org-php.gpg  && \
    osname=`grep VERSION_CODENAME /etc/os-release | cut -d= -f2`  && \
    echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ ${osname} main" > /etc/apt/sources.list.d/deb.sury.org.list 

RUN apt-get update  && \
    apt-get install -y php7.3-fpm  && \
    updatedb 

RUN apt-get install -y php7.3-mysql php7.3-pgsql php7.3-zip php7.3-yaml php7.3-xml php7.3-sqlite3 php7.3-soap php7.3-redis php7.3-oauth php7.3-mcrypt php7.3-mbstring php7.3-intl php7.3-imap php7.3-gd php7.3-curl 

RUN sed -i 's/www-data/nginx/g' /etc/php/7.3/fpm/pool.d/www.conf  && \
    sed -i 's/;listen.mode/listen.mode/g' /etc/php/7.3/fpm/pool.d/www.conf 

RUN sed -i 's/--nodaemonize/--allow-to-run-as-root --nodaemonize/g' /lib/systemd/system/php7.3-fpm.service 

RUN mkdir -p /var/cache/nginx/client_temp && \
    chown nginx:nginx -R /var/cache/  && \
    mkdir -p /run/php/  && \
    chown nginx:nginx -R /var/run && \
    chown nginx:nginx -R /run && \
    chown nginx:nginx /lib/systemd/system/php7.3-fpm.service  && \
    chown nginx:nginx /etc/systemd/system/multi-user.target.wants/php7.3-fpm.service  && \
    chown nginx:nginx /usr/sbin/php-fpm7.3  && \
    chown nginx:nginx /etc/php/7.3/fpm/php-fpm.conf  && \
    chown nginx:nginx -R /etc/php/7.3/  && \
    chown nginx:nginx /var/log  && \
    chown nginx:nginx /usr/lib/php/php-fpm-socket-helper  && \
    mkdir -p /var/www/html  && \
    chown nginx:nginx -R /var/www 

COPY index.php /var/www/html/index.php 

COPY nginx.conf /etc/nginx/nginx.conf 

COPY default.conf /etc/nginx/conf.d/default.conf 

USER nginx

EXPOSE 80

CMD /usr/sbin/php-fpm7.3 --fpm-config /etc/php/7.3/fpm/php-fpm.conf && nginx -g 'daemon off;' 

# CMD ["/bin/sh" "-c" "/usr/sbin/php-fpm7.3 --fpm-config /etc/php/7.3/fpm/php-fpm.conf  && nginx -g 'daemon off;'"]
# CMD /usr/sbin/php-fpm7.3 --fpm-config /etc/php/7.3/fpm/php-fpm.conf && nginx -g 'daemon off;' 
# CMD service php7.3-fpm start  && nginx -g 'daemon off;'


# docker build -t phpn-php7.3:0.0.3 .
# docker run -it -p 80:80 phpn-php7.3:0.0.1 /bin/bash
