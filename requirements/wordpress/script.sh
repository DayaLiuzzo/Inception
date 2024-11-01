#!/bin/sh
cd /var/www/html


curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root --path=/var/www/html
./wp-cli.phar config create --dbname=$DB_NAME --dbuser=$DB_USERNAME --dbpass=$DB_USERPASS --dbhost=mariadb --allow-root
# --path=$PATHROOT
./wp-cli.phar core install --url=localhost --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com --allow-root

exec "$@"