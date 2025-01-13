#!bin/sh

sed -i 's\listen = /run/php/php7.4-fpm.sock\listen = wordpress:9000\g' /etc/php/7.4/fpm/pool.d/www.conf
sed -i 's\listen.owner = www-data\listen.owner = nobody\g' /etc/php/7.4/fpm/pool.d/www.conf
sed -i 's\listen.group = www-data\listen.group = nogroup\g' /etc/php/7.4/fpm/pool.d/www.conf

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar  /usr/local/bin/wp

if ( ! wp core is-installed --allow-root )
then
	wp core download --allow-root
	wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --dbprefix=wp_
	wp core install --allow-root --url=$URL --title=$TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASS --admin_email=$ADMIN_EMAIL
fi

mkdir -p /run/php
exec /usr/sbin/php-fpm7.4 --nodaemonize
