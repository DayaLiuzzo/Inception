FROM alpine:3.19.4



RUN apk update && \
    apk add \
    php \
    php-fpm \
    php-phar \
    php-cli \
    php-mysqli \
    php-mbstring \
    curl 

RUN adduser -D -G www-data www-data
    
COPY www.conf /etc/php82/php-fpm.d/.

COPY script.sh .
RUN chmod +x script.sh


# CMD ["./script.sh"]
ENTRYPOINT ["./script.sh", "php-fpm82", "-F"]

# ENTRYPOINT ["tail", "-f", "/dev/null"]