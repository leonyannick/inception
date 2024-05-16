#!/bin/bash

export SQL_USER_PW=$(cat $SQL_USER_PW_FILE)
export SQL_ROOT_PW=$(cat $SQL_ROOT_PW_FILE)

envsubst < /etc/mysql/init.sql > /etc/mysql/init_temp.sql && mv /etc/mysql/init_temp.sql /etc/mysql/init.sql

exec mysqld_safe --bind_address=0.0.0.0