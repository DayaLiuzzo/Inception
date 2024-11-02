FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install mariadb-server -y && \
    apt-get clean

EXPOSE 3306
    
RUN chown -R mysql:mysql /var/lib/mysql
    
RUN mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld && \
    chmod 755 /run/mysqld

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/.

COPY script.sh .
RUN chmod +x script.sh

CMD ["./script.sh"]
# ENTRYPOINT ["tail" , "-f", "/dev/null"]