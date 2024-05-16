#Get base image from docker hub
FROM debian:bullseye

WORKDIR /

#listen to port 3306 at runtime. Port 3306 ist default port for maria db to listen to DB server
EXPOSE 3306

# Update and upgrade:
RUN apt update -y && apt upgrade -y

# Install MariaDB:
RUN apt install -y mariadb-server \
				   gettext

# Copy config file from the host machine for mariadb to the /etc of the container
COPY ./my.cnf /etc/my.cnf

# Copy setup script from the host machine to the container:
COPY ./mariadb_setup.sh /usr/local/bin

COPY ./init.sql /etc/mysql/init.sql

# give execution rights to the .sh file
RUN chmod +x /usr/local/bin/mariadb_setup.sh

# RUN	mkdir /run/mysqld

# When the container starts, this script is executed.
# There a new db and user is created and the service is gets started.
ENTRYPOINT [ "bash", "/usr/local/bin/mariadb_setup.sh" ]
