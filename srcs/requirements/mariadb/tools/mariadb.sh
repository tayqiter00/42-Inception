#!/bin/bash

service mysql start 

mysql << EOF
CREATE DATABASE IF NOT EXISTS ${wp_database};
CREATE USER IF NOT EXISTS '${mariadb_user}'@'localhost' IDENTIFIED BY '${mariadb_pwd}';
GRANT ALL PRIVILEGES ON ${wp_database}.* TO '${mariadb_user}'@'localhost';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${mariadb_root_pwd}';
FLUSH PRIVILEGES;
EOF

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld
