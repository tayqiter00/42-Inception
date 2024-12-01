#!/bin/bash

# & runs it as a background first
mariadbd --skip-networking &

until mariadb -u root -e "SELECT 1;" &> /dev/null; do
    sleep 1
done

mariadb -u root << EOF
CREATE DATABASE IF NOT EXISTS ${wp_database};
CREATE USER IF NOT EXISTS '${mariadb_user}'@'localhost' IDENTIFIED BY '${mariadb_pwd}';
GRANT ALL PRIVILEGES ON ${wp_database}.* TO '${mariadb_user}'@'localhost';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${mariadb_root_pwd}';
FLUSH PRIVILEGES;
EOF

killall mariadbd

exec mariadbd
