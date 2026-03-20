FROM alpine:3.19.4

RUN apk update && apk add \
    php82 \
    php82-fpm \
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
    && ls -la \
    && mv phpMyAdmin-5.2.3-all-languages /var/www/phpmyadmin \
    && rm phpMyAdmin-5.2.3-all-languages.tar.gz


COPY conf/config.inc.php /var/www/phpmyadmin/
COPY conf/www.conf /etc/php82/php-fpm.d/www.conf

EXPOSE 9001
CMD ["php-fpm82", "-F"]
