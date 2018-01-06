# Dockerfile for the arm32v7/isc-dhcp-server container
FROM resin/raspberrypi3-debian:jessie
MAINTAINER Matthew Baum matt@baum.network, atomicbaum1@gmail.com

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -q -y update \
 && apt-get -q -y install apt-utils \
                          isc-dhcp-server \
 && apt-get -q -y autoremove \
 && apt-get -q -y clean \
 && rm -rf /var/lib/apt/lists/*

# Copy the support files over
COPY support-files/dhcpd.conf /etc/dhcp/dhcpd.conf
COPY support-files/isc-dhcp-server /etc/default/isc-dhcp-server

EXPOSE 67/udp 67/tcp 68/udp 68/tcp
ENTRYPOINT ["/usr/sbin/dhcpd"]

