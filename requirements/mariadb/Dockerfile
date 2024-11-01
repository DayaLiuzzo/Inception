FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y mariadb-server && \
    apt-get clean

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/.

COPY script.sh .

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld && chmod 755 /run/mysqld
RUN chmod +x script.sh

EXPOSE 3306

# CMD ["./script.sh"]
ENTRYPOINT ["tail" , "-f", "/dev/null"]