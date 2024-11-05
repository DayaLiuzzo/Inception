FROM debian:bullseye

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install mariadb-server -y

EXPOSE 3306
    
RUN chown -R mysql:mysql /var/lib/mysql
    
RUN mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld && \
    chmod 755 /run/mysqld

COPY script.sh .
RUN chmod +x script.sh

ENTRYPOINT [ "./script.sh" ]

CMD ["mysqld_safe", "--bind-address=0.0.0.0"]