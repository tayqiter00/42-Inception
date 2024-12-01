FROM debian:stable-backports

LABEL maintainer="qtay <qtay@student.42kl.edu.my>"

RUN apt-get update -y && apt-get install -y mariadb-server

COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d
COPY ./tools/mariadb.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/mariadb.sh

ENTRYPOINT ["/usr/local/bin/mariadb.sh"]
