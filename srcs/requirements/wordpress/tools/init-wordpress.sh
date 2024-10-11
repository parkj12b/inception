#!/bin/bash
cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root

./wp-cli.phar config create --dbname=${DB_DATABASE} --dbuser=${DB_USERNAME} \
  --dbpass=${DB_PASSWORD} --dbhost=${DB_HOST} --allow-root

./wp-cli.phar core install --url=${DOMAIN_NAME} --title=inception \
  --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASS} --admin_email=admin@admin.com \
  --allow-root

./wp-cli.phar user create ${USER_NAME} abc@gmail.com --role=subscriber --user_pass=${USER_PASS} \
  --first_name=John --last_name=Doe --display_name="John Doe" \
  --allow-root
php-fpm7.4 -F