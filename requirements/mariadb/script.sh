#!/bin/bash

# Start the MariaDB service
echo "DOCKERFILE SET UP SCRIPT STARTING "
chown -R mysql:mysql /var/lib/mysql
service mariadb start
echo "TEST"
# Wait for the server to start
sleep 5 

# Create the database and user if they don't exist
if [ ! -f /var/lib/mysql/$DB_NAME ]; then
    echo "Creating database and user..."
    echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" | mariadb -u root -p$DB_ROOTPASS
    echo "CREATE USER IF NOT EXISTS '$DB_USERNAME'@'localhost' IDENTIFIED BY '$DB_USERPASS';" | mariadb -u root -p$DB_ROOTPASS  
    echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USERNAME'@'localhost';" | mariadb -u root -p$DB_ROOTPASS 
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOTPASS';" | mariadb -u root -p$DB_ROOTPASS 
    echo "FLUSH PRIVILEGES;" | mariadb -u root -p$DB_ROOTPASS 
    mysqladmin -uroot -p$DB_ROOTPASS shutdown
else
    echo "Database $DB_NAME already exists."
fi

# Start the MariaDB server in the foreground
exec mysqld_safe