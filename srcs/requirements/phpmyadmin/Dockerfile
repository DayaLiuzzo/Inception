FROM alpine:3.19.4

RUN apk update && apk add \
    lighttpd \
    php82 \
    php82-cgi \
    php82-session \
    php82-mysqli \
    php82-mbstring \
    php82-json \
    php82-iconv \
    php82-ctype \
    php82-zip \
    php82-gd \
    wget \
    tar

RUN mkdir -p /var/www && \
    wget https://files.phpmyadmin.net/phpMyAdmin/5.2.3/phpMyAdmin-5.2.3-all-languages.tar.gz \
    && tar -xzf phpMyAdmin-5.2.3-all-languages.tar.gz \
    && mv phpMyAdmin-5.2.3-all-languages /var/www/phpmyadmin \
    && rm phpMyAdmin-5.2.3-all-languages.tar.gz

RUN echo "server.modules += (\"mod_fastcgi\")" >> /etc/lighttpd/lighttpd.conf && \
    echo "fastcgi.server = (\".php\" => ((\"bin-path\" => \"/usr/bin/php-cgi82\", \"socket\" => \"/tmp/php.socket\")))" >> /etc/lighttpd/lighttpd.conf && \
    echo "server.document-root = \"/var/www/phpmyadmin\"" >> /etc/lighttpd/lighttpd.conf

COPY conf/config.inc.php /var/www/phpmyadmin/

EXPOSE 80
CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]