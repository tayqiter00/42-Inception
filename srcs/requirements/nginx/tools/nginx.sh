#!/bin/bash

openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 \
-nodes -out /etc/ssl/certs/nginx-certificate.crt \
-keyout /etc/ssl/private/nginx.key \
-subj "/C=MY/ST=Selangor/L=Petaling Jaya/O=42KL/CN=qtay/"

# chmod 600 /etc/ssl/private/nginx.key

nginx -g "daemon off"
