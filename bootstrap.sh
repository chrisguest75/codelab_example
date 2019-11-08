#!/bin/sh
echo "bootstrap.sh"
if [ -z "$PORT" ];then
    PORT=8080
fi
echo "PORT=$PORT"
export PORT=$PORT

./write-config > /etc/nginx/conf.d/default.conf 

cat /etc/nginx/conf.d/default.conf 

nginx -g "daemon off;"