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

RUN wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz \
    && tar -xzf phpMyAdmin-latest-all-languages.tar.gz \
    && mv phpMyAdmin-*-all-languages /var/www/phpmyadmin \
    && rm phpMyAdmin-latest-all-languages.tar.gz

COPY conf/config.inc.php /var/www/phpmyadmin/

EXPOSE 9001
CMD ["php-fpm82", "-F"]