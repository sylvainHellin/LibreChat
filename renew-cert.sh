#!/bin/bash

# Renew the certificate
docker run --rm \
    -v /etc/letsencrypt:/etc/letsencrypt \
    -v /var/lib/letsencrypt:/var/lib/letsencrypt \
    -v /docker-volumes/data/letsencrypt:/data/letsencrypt \
    -v /var/log/letsencrypt:/var/log/letsencrypt \
    certbot/certbot renew \
    --webroot \
    --webroot-path=/data/letsencrypt

# Reload nginx to pick up the new certificate
docker exec LibreChat-NGINX nginx -s reload 