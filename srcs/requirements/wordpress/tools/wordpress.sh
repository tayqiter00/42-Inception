#!/bin/bash

curl -o wordpress.tar.gz https://wordpress.org/latest.tar.gz
tar -xzvf wordpress.tar.gz
mv wordpress/* /var/www/html
# chown -R www-data:www-data /var/www/html

mv ./wp-config.php /var/www/html/wordpress

sed -i "s/database_name_here/$wp_database/g" /var/www/html/wordpress/wp-config.php
sed -i "s/username_here/$mariadb_user/g" /var/www/html/wordpress/wp-config.php
sed -i "s/password_here/$mariadb_pwd/g" /var/www/html/wordpress/wp-config.php

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

cd /var/www/html
wp core install --url=$domain_name/ --title=$wp_title --admin_user=$admin_user --admin_password=$admin_pwd --admin_email=$admin_email --skip-email --allow-root
wp user create $wp_user $wp_email --role=author --user_pass=$wp_pwd --allow-root

# not sure
exec php-fpm8.2 -F
