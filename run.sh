#!/bin/sh
set -e

docker rm -f app rp
docker network rm int || true
docker network create int
(cd app && docker build -t app . && docker run --name app --net=int  -itd app)
(cd rev-proxy && docker run --name rp --network int -p 443:443 -v /etc/apache2/.htpasswd:/etc/apache2/.htpasswd -v /etc/letsencrypt:/etc/letsencrypt -v $(pwd)/nginx.conf:/etc/nginx/nginx.conf -d nginx)
