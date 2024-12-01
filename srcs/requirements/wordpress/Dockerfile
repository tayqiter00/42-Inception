FROM debian:stable-backports

RUN apt-get update && apt-get install -y php-fpm php-mysql curl

COPY ./tools/wordpress.sh /usr/local/bin/wordpress.sh
COPY ./tools/wp-config.php /

RUN chmod +x /usr/local/bin/wordpress.sh

CMD [ "/usr/local/bin/wordpress.sh" ]