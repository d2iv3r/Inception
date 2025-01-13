FROM debian:bullseye

RUN apt update && apt install nginx vim openssl -y --no-install-recommends && \
	mkdir -p /etc/nginx/ssl && \
	openssl req -x509 -nodes -out /etc/nginx/ssl/ssl_cert.crt -keyout /etc/nginx/ssl/ssl_key.key -subj "/C=$C/ST=$ST/L=$L/O=$O/CN=$CN"

COPY ./conf/server.conf /etc/nginx/conf.d/

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
