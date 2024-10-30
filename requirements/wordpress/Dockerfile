FROM alpine:3.19.4

RUN apk update && \
    apk upgrade -y && \
    apk  add \
    php-fpm \
    php \
    php-mysqli\
    curl

COPY www.conf /etc/php/8.2/fpm/pool.d/.
COPY script.sh .
RUN chmod +x script.sh

ENTRYPOINT ["./script.sh", "php-fpm8.2", "-F"]