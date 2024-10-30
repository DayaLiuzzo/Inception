FROM alpine:3.19.4

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
    php82-fpm \
    php82 \
    php82-phar \
    php82-mysqli \
    php82-mbstring \
    php82-json \
    php82-curl \
    php82-gd \
    php82-xml \
    php82-zip \
    curl \
    bash

COPY www.conf /etc/php82/php-fpm.d.
COPY script.sh .
RUN chmod +x script.sh

ENTRYPOINT ["./script.sh", "php-fpm82", "-F"]
# ENTRYPOINT ["tail", "-f", "/dev/null"]