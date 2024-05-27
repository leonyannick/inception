FROM debian:bullseye

WORKDIR /

#default port for mariadb database
EXPOSE 3306

RUN apt update -y && apt upgrade -y

RUN apt install -y mariadb-server \
				   gettext

COPY ./conf/my.cnf /etc/my.cnf

COPY ./tools/mariadb_setup.sh /usr/local/bin
RUN chmod +x /usr/local/bin/mariadb_setup.sh

COPY ./tools/init.sql /etc/mysql/init.sql

RUN	mkdir /run/mysqld

ENTRYPOINT [ "bash", "/usr/local/bin/mariadb_setup.sh" ]
