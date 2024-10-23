FROM debian:latest

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y mariadb-server && \
    apt-get clean

CMD ["mysqld_safe"]