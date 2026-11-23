#!/bin/sh
PORT=${PORT:-10000}
UUID=${UUID:-11111111-2222-3333-4444-555555555555}
sed -i "s/listen 10000;/listen $PORT;/" /etc/nginx/http.d/default.conf
sed -i "s/__UUID__/$UUID/" /etc/xray/config.json
/usr/local/bin/xray run -config /etc/xray/config.json &
exec nginx -g 'daemon off;'
