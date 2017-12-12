#Dockerfile for the arm32v7/isc-dhcp-server container
FROM alpine:3.6
MAINTAINER Matthew Baum atomicbaum1@gmail.com

RUN addgroup -S dhcp && adduser -S -G dhcp dhcp

# grab su-exec for easy step-down from root
RUN apk add --no-cache 'su-exec>=0.2'

ENV ISC_DHCP_SERVER_VERSION=4.3.6
ENV ISC_DHCP_SERVER_DOWNLOAD_URL="https://www.isc.org/downloads/file/dhcp-4-3-6/?version=tar-gz"
COPY support-files/dhcp-4.3.6.tar.gz isc-dhcp-server.tar.gz
RUN set -ex; \
    apk add --no-cache --virtual .build-deps \
        coreutils \
        gcc \
        linux-headers \
        make \
        musl-dev \
        openssl \
        perl \
        ; \
        \
        #wget -O isc-dhcp-server.tar.gz "$ISC_DHCP_SERVER_DOWNLOAD_URL"; \
        #TODO: Check SHA \
        mkdir -p /usr/src/isc-dhcp-server; \
        tar -xzf isc-dhcp-server.tar.gz -C /usr/src/isc-dhcp-server --strip-components=1; \ 
        rm isc-dhcp-server.tar.gz; \
        (cd /usr/src/isc-dhcp-server && ./configure); \
        make -C /usr/src/isc-dhcp-server; \
        make -C /usr/src/isc-dhcp-server install; \
        rm -r /usr/src/isc-dhcp-server; \
        apk del .build-deps

# Copy the support files over
COPY support-files/dhcpd.conf /etc/dhcp/dhcpd.conf
COPY support-files/isc-dhcp-server /etc/default/isc-dhcp-server
COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 67 68
CMD ["/bin/sh"]
