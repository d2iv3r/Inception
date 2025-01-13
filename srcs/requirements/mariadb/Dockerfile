FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install mariadb-server vim -y --no-install-recommends

COPY ./tools/mysqlScript.sh /tmp

EXPOSE 3306

CMD [ "sh", "/tmp/mysqlScript.sh" ]
