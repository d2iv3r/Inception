FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install vim wget -y --no-install-recommends && \
	apt install php php-fpm php-mysql mariadb-client -y --no-install-recommends && \
	apt install ca-certificates -y --no-install-recommends

WORKDIR /var/www/html/wordpress

COPY ./tools/wpscript.sh /tmp

EXPOSE 9000

CMD [ "sh", "/tmp/wpscript.sh" ]
