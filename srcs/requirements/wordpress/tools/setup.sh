#!/bin/bash

set -e

# Wait for MariaDB
until mysqladmin ping -h mariadb --silent; do
    echo "Waiting for MariaDB..."
    sleep 1
done

# Load secrets
MYSQL_PASSWORD=$(cat /run/secrets/db_password)
WP_ADMIN_PASSWORD=$(cat /run/secrets/wp_admin_password)
# Load env vars
# MYSQL_DATABASE=${MYSQL_DATABASE}
# MYSQL_USER=${MYSQL_USER}
# DOMAIN_NAME=${DOMAIN_NAME}

# WP_ADMIN=${WP_ADMIN}
# WP_ADMIN_EMAIL=${WP_ADMIN_EMAIL}


# WP_USER=${WP_USER}
# WP_USER_EMAIL=${WP_USER_EMAIL}
WP_USER_PASSWORD=$(cat /run/secrets/wp_user_password)

# Go to WordPress dir
cd /var/www/html

# Download WP if needed
 if [ ! -f wp-load.php ]; then
    echo "Downloading WordPress..."
    wp core download --allow-root
fi

#Configure WP
if [ ! -f wp-config.php ]; then
    echo "Setting up WordPress..."

    wp config create \
        --dbname="$MYSQL_DATABASE" \
        --dbuser="$MYSQL_USER" \
        --dbpass="$MYSQL_PASSWORD" \
        --dbhost="mariadb:3306" \
        --allow-root

    wp core install \
        --url="https://$DOMAIN_NAME" \
        --title="inception" \
        --admin_user="$WP_ADMIN" \
        --admin_password="$WP_ADMIN_PASSWORD" \
        --admin_email="$WP_ADMIN_EMAIL" \
        --skip-email \
        --allow-root

    wp user create \
        "$WP_USER" "$WP_USER_EMAIL" \
        --user_pass="$WP_USER_PASSWORD" \
        --role=author \
        --allow-root

    echo "WordPress installed!"
fi

# Permissions
chown -R www-data:www-data /var/www/html

# Run PHP-FPM
exec php-fpm8.2 -F