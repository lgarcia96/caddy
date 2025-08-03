FROM caddy:2.10-builder AS builder

#Build Caddy with Cloudflare DNS support for automatic TLS certificate management
#If you need addt'l plugins. Add new line like so; RUN xcaddy build --with plugin url
RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.10

COPY --from=builder /usr/bin/caddy /usr/bin/caddy