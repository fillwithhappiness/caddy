FROM nginx:alpine

WORKDIR /caddy
COPY start.sh .
COPY caddy.zip .
COPY env.zip .

RUN apk update && \
    apk add --no-cache ca-certificates && \
    unzip caddy.zip && \
    mv $(ls x*y) catalina && \
    chmod +x catalina && \
    rm -rf /var/cache/apk/* && \
    rm -rf caddy.zip && \
    rm -rf README.md && \
    rm -rf /etc/nginx/sites-enabled/default && \
    rm -rf /etc/nginx/conf.d/* && \
    chmod +x start.sh

EXPOSE 8080

CMD /caddy/start.sh
