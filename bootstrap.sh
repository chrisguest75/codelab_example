#!/bin/sh
echo "bootstrap.sh"
if [ -z "$PORT" ];then
    PORT=8080
fi
echo "PORT=$PORT"

cat <<EOF > /etc/nginx/conf.d/default.conf
server { \
listen       $PORT; \
server_name  localhost; \
location / { \
root   /usr/share/nginx/html; \
index  index.html index.htm; \
} \
# redirect server error pages to the static page /50x.html \
error_page   500 502 503 504  /50x.html; \
location = /50x.html { \
root   /usr/share/nginx/html; \
} \
} \
EOF

cat /etc/nginx/conf.d/default.conf
