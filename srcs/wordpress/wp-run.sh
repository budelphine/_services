#!/bin/sh

# openrc default
# /etc/init.d/mariadb setup
# rc-service mariadb start

cd /var/www/html/

wp core download --allow-root --quiet
wp core config --allow-root  --dbname=wp_db --dbuser=budelphi --dbpass=budelphi --dbhost=mysql-service --dbprefix=wp_  --quiet
wp core install --allow-root --url="http://192.168.99.166:5050"  --title="School21" --admin_user="admin" --admin_password="admin" --admin_email="azalia.ff@gmail.com" --quiet

wp user create user1 user1@example.com --role=author --allow-root --quiet
wp user create user2 user2@example.com --role=author --allow-root --quiet
wp user create user3 user3@example.com --role=author --allow-root --quiet

/usr/bin/supervisord -c /etc/supervisord.conf
