#penultimate version of debian
FROM debian:bullseye

#change to workdir -> subsequent RUN, CMD, ENTRYPOINT, COPY and ADD instructions affected
WORKDIR /var/www/html

RUN apt update -y && apt upgrade -y

#install the nginx and openssl
RUN apt -y install \
		wget \
		php7.4 \
		php7.4-fpm \
		php-mysql \
		mariadb-client

#copy the wordpressconf from the host machine to the docker container
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# download the wordpress command line interface (PHAR = PHP Archive)
# add executable permissions
# move the cli 
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# copy the setup from the host machine to the container
# add exec rights to the shell script after moving
COPY ./tools/wordpress_setup.sh /usr/local/bin
RUN chmod +x /usr/local/bin/wordpress_setup.sh

# after the container is created the wordpress_setup.sh is executed to configure
# wordpress
ENTRYPOINT [ "bash", "/usr/local/bin/wordpress_setup.sh" ]
