#penultimate version of debian
FROM debian:bullseye

#change to workdir -> subsequent RUN, CMD, ENTRYPOINT, COPY and ADD instructions affected
WORKDIR  /

RUN apt update -y && apt upgrade -y

#install the nginx and openssl
RUN apt install nginx -y && apt install openssl -y

#create self-signed x.509 certificate
#/etc/ssl/private and /etc/ssl/certs are common places to store these values
RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
			-keyout /etc/ssl/private/nginx-tls.key \
			-out /etc/ssl/certs/nginx-tls.crt \
			-subj "/C=DE/\
					ST=Berlin/\
					L=Berlin/\
					O=42_Berlin/\
					OU=student/\
					CN=lbaumann/\
					emailAddress=lbaumann@student.42berlin.de"

EXPOSE 443

COPY nginx.conf /etc/nginx/conf.d/server.conf

#daemon off: run nginx in the foreground
CMD [ "nginx", "-g", "daemon off;" ]
