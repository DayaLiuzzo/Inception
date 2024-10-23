FROM debian:latest

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y php-fpm && \
    apt-get clean

COPY www.conf /etc/php/8.2/fpm/pool.d/.

CMD ["php-fpm8.2", "-F"]