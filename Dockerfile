FROM nginx:alpine
RUN apk add --no-cache curl unzip
RUN curl -L -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && unzip /tmp/xray.zip -d /usr/local/bin/ && chmod +x /usr/local/bin/xray && rm /tmp/xray.zip
COPY xray/config.json /etc/xray/config.json
COPY nginx/nginx.conf /etc/nginx/http.d/default.conf
COPY start.sh /start.sh
RUN chmod +x /start.sh
EXPOSE 10000
CMD ["/bin/sh", "/start.sh"]
