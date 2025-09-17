FROM docker.io/golang:latest AS builder

RUN wget -O /tmp/xcaddy.deb "https://github.com/caddyserver/xcaddy/releases/download/v0.4.5/xcaddy_0.4.5_linux_amd64.deb" && dpkg -i /tmp/xcaddy.deb && rm /tmp/xcaddy.deb
RUN xcaddy build --with github.com/caddy-dns/cloudflare --output /usr/bin/caddy
RUN chmod +x /usr/bin/caddy
