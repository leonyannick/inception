#!/bin/bash

# #start the (by Docker) installed SQL service
# service mariadb start

# # Setup the data base
# # -e: Execute a single line in the command line

# #create a new database with the name from the .env
# mariadb -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# # #create a new user
# mariadb -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '$(cat $SQL_USER_PW_FILE)';"

# # #give all privileages to the user
# mariadb -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '$(cat $SQL_USER_PW_FILE)';"

# # #change the root user pwd to the one from the .env
# mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$(cat $SQL_ROOT_PW_FILE)';"

# # #make the changes be effective immediately
# mariadb -e "FLUSH PRIVILEGES;"

# #shutdown to make the changes happen
# mysqladmin -u root -p$(cat $SQL_ROOT_PW_FILE) shutdown

# #start the mysql service again
# exec mysqld_safe

# Create the SQL init script
echo "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;" > /etc/mysql/init.sql
echo "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '$(cat $SQL_USER_PW_FILE)';" >> /etc/mysql/init.sql
echo "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO '${SQL_USER}'@'%' IDENTIFIED BY '$(cat $SQL_USER_PW_FILE)';" >> /etc/mysql/init.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$(cat $SQL_ROOT_PW_FILE)';" >> /etc/mysql/init.sql
echo "FLUSH PRIVILEGES;" >> /etc/mysql/init.sql

# Start the MariaDB server
exec mysqld_safe --bind_address=0.0.0.0