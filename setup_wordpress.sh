#!/bin/bash

DB_NAME=$1
DB_USER=$2
DB_PASSWORD=$3
DB_HOST=$4

# Загрузка WordPress
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
mv wordpress/* /var/www/html/

# Настройка wp-config.php
cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
sed -i "s/database_name_here/$DB_NAME/g" /var/www/html/wp-config.php
sed -i "s/username_here/$DB_USER/g" /var/www/html/wp-config.php
sed -i "s/password_here/$DB_PASSWORD/g" /var/www/html/wp-config.php
sed -i "s/localhost/$DB_HOST/g" /var/www/html/wp-config.php

# Установка разрешений для каталога WordPress
chown -R www-data:www-data /var/www/html/
chmod -R 755 /var/www/html/