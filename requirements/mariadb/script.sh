#!/bin/bash
/etc/init.d/mariadb start

mysql_secure_installation << EOF
$DB_ROOTPASS
Y
n
Y
n
Y
Y
EOF

# mysql -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
# mysql -e "CREATE USER IF NOT EXISTS \`${DB_USERNAME}\`@'localhost' IDENTIFIED BY '${DB_USERPASS}';"
# mysql -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USERNAME}\`@'%' IDENTIFIED BY '${DB_USERPASS}';"
# mysql -e "FLUSH PRIVILEGES;"
echo "CREATING DATABASE"
mysql -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
echo "CREATING USER"
mysql -e "CREATE USER IF NOT EXISTS \`${DB_USERNAME}\`@'localhost' IDENTIFIED BY '${DB_USERPASS}';"
echo "GRANTING PRIVILEGES"
mysql -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USERNAME}\`@'localhost';"
mysql -e "FLUSH PRIVILEGES;"
echo "ALTERING USER"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_USERPASS}';"
echo "FLUSHING"
mysql -e "FLUSH PRIVILEGES;"

echo "CMDS DONE"
/etc/init.d/mariadb stop
echo "here1"

exec "$@"