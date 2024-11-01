#!/bin/bash

# Start the MariaDB service
service mariadb start

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




# #!/bin/bash


# if [ -f /var/lib/mysql/$DB_NAME ]; then
#     echo "Database $DB_NAME already exists."
# else

#     sleep 5 

#     echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" | mariadb -u root 

#     echo "CREATE USER IF NOT EXISTS $DB_USERNAME@'localhost' IDENTIFIED BY '$DB_USERPASS';" | mariadb -u root  

#     echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO $DB_USERNAME@'%' IDENTIFIED BY '$DB_USERPASS';" | mariadb -u root 

#     echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOTPASS';" | mariadb -u root 

#     echo "FLUSH PRIVILEGE;" | mariadb -u root -p$DB_ROOTPASS 

#     mysqladmin -uroot -p$DB_ROOTPASS shutdown --force

#     sleep 5
# fi 

# exec mysqld_safe
# # exec "$@"