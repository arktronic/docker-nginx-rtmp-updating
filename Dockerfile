FROM arktronic/ubuntu-auto-upgrade:1.1

RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y --no-install-recommends nginx-core libnginx-mod-rtmp

COPY ./supervisord.conf /etc/supervisor/supervisord.conf

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
 && ln -sf /dev/stderr /var/log/nginx/error.log

VOLUME /conf
VOLUME /data
