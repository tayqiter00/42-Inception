FROM debian:stable-backports

LABEL maintainer="qtay <qtay@student.42kl.edu.my>"

RUN apt-get update && apt-get install -y nginx openssl

COPY ./tools/nginx.conf /etc/nginx/sites-available/default
COPY ./tools/nginx.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/nginx.sh

CMD [ "/usr/local/bin/nginx.sh" ]
