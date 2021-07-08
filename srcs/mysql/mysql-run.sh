#!/bin/sh

# Init openrc to start services --> mariadb
openrc default
/etc/init.d/mariadb setup
rc-service mariadb start

# Create user
# echo "CREATE USER 'admin'@'%' IDENTIFIED BY '123456';" | mysql -u root --skip-password
echo "CREATE DATABASE wp_db;" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON *.* TO 'budelphi'@'%' IDENTIFIED BY 'budelphi' WITH GRANT OPTION" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

# Restart maridb
rc-service mariadb stop
/usr/bin/mysqld_safe --datadir="/var/lib/mysql"
