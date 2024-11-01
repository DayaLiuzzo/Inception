#!/bin/bash

# mysql_install_db
if [-f /var/lib/mysql/$DB_name]; then

else
    service mariadb start

    sleep 5 

    echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" | mariadb -u root 

    echo "CREATE USER IF NOT EXISTS $DB_USERNAME@'localhost' IDENTIFIED BY '$DB_USERPASS';" | mariadb -u root  

    echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO $DB_USERNAME@'%' IDENTIFIED BY '$DB_USERPASS';" | mariadb -u root 

    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOTPASS';" | mariadb -u root 

    echo "FLUSH PRIVILEGE;" | mariadb -u root -p$DB_ROOTPASS 

    mysqladmin -uroot -p$DB_ROOTPASS shutdown --force

    sleep 5
fi 

exec "$@"