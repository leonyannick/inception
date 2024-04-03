#penultimate version of debian
FROM debian:bullseye

RUN apt update -y && apt upgrade -y

#install the nginx and openssl
RUN apt install nginx -y

#delete default configuration files
# RUN rm /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf

COPY ./conf/nginx.conf /etc/nginx/conf.d/server.conf

#run the service in the foreground
CMD [ "nginx", "-g", "daemon off;" ]
