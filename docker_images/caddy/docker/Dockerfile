FROM docker.io/ubuntu:24.04 AS builder

RUN apt-get -y update && apt-get -y install gpg vim git

RUN apt-get -y update && apt-get -y install wget golang
RUN wget -O /tmp/xcaddy.deb "https://github.com/caddyserver/xcaddy/releases/download/v0.4.4/xcaddy_0.4.4_linux_amd64.deb" && dpkg -i /tmp/xcaddy.deb && rm /tmp/xcaddy.deb
RUN xcaddy build --with github.com/caddy-dns/cloudflare --output /usr/bin/caddy
RUN chmod +x /usr/bin/caddy
