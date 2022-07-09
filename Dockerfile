FROM nginx:1.19.2-alpine

RUN apk update && \
    # apk add wget && \
    rm -rf /var/cache/apk/*

# Install insecure-js
COPY ./web /var/www/openvidu-insecure-js-screen-share
RUN chown -R nginx:nginx /var/www/openvidu-insecure-js-screen-share

# Nginx conf
COPY ./docker/openvidu-insecure-js-screen-share.conf /etc/nginx/conf.d/default.conf

# Entrypoint
COPY ./docker/entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh

CMD /usr/local/bin/entrypoint.sh
