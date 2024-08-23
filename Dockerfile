FROM alpine:3.9

RUN apk update && apk add \
#    vim \
#    mc \
    bind-tools \
#    wget \
    curl

COPY docker/namecheap-dns-files/root /root
RUN chmod +x /root/namecheap-update-dns.sh

COPY docker/namecheap-dns-files/config/crontab /etc/cron/crontab

# Init cron
RUN crontab /etc/cron/crontab

CMD ["crond", "-f"]