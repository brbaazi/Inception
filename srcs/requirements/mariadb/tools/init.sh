#!/bin/bash
set -e

MYSQL_ROOT_PASSWORD=$(cat /run/secrets/db_root_password)
MYSQL_PASSWORD=$(cat /run/secrets/db_password)

echo "Starting MariaDB..."
mysqld_safe &

echo "Waiting for MariaDB to be ready..."
until mysqladmin ping --silent; do
    sleep 1
done

echo "Configuring database..."
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" <<EOF
CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
EOF

echo "Stopping temporary MariaDB..."
mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown

echo "Starting MariaDB in foreground..."
exec mysqld_safe