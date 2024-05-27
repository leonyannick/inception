#!/bin/bash

# give MariaDB time to lauch correctly:
while ! mysqladmin ping --host=$DB_HOST --port=$DB_HOST_PORT --silent; do
	echo "$(date +%d%m%y\ %H:%M:%S) Waiting for database connection..."
	sleep 5
done

echo "Connection to $DB_HOST succesfull"


if ! wp core is-installed --allow-root; then
    wp core download --allow-root

    if [ ! -f wp-config.php ]; then
        wp config create --allow-root \
                        --dbname=$SQL_DATABASE \
                        --dbuser=$SQL_USER \
                        --dbpass=$(cat $SQL_USER_PW_FILE) \
                        --dbhost=$DB_HOST:$DB_HOST_PORT
    fi

	#:443 only needed for localhost. can later be removed in the vm with the right domain: lbaumann.42.fr
    wp core install --url=$DOMAIN_NAME \
                    --title=$SITE_TITLE \
                    --admin_user=$WP_ADMIN \
                    --admin_password=$(cat $WP_ADMIN_PW_FILE) \
                    --admin_email=$WP_ADMIN_EMAIL \
                    --allow-root
	
	# create a new wordpress user with the credentials from the .env
	wp user create --allow-root $WP_USER $WP_USER_EMAIL \
					--role=editor \
					--user_pass=$(cat $WP_USER_PW_FILE) \

fi



# # create dir if not existant
if [ ! -d /run/php ]; then
	mkdir /run/php
fi

# start the fast cgi process manager and run it in the foreground
/usr/sbin/php-fpm7.4 -F
