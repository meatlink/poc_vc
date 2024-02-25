FROM nginx:1.25.4-alpine
RUN chown -R nginx:nginx \
        /var/cache/nginx \
        /var/log/nginx \
        /etc/nginx/conf.d \
    && \
    sed -i 's/^\(pid\s\+\).*;$/\1\/tmp\/nginx.pid;/' /etc/nginx/nginx.conf
USER nginx

COPY index.html /usr/share/nginx/html/
