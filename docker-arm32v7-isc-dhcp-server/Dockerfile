# Dockerfile for the arm32v7/isc-dhcp-server container
FROM resin/raspberrypi3-debian:jessie
MAINTAINER Matthew Baum atomicbaum1@gmail.com

RUN apt-get update
RUN apt-get install -y isc-dhcp-server

# Copy the support files over
COPY support-files/dhcpd.conf /etc/dhcp/dhcpd.conf
COPY support-files/isc-dhcp-server /etc/default/isc-dhcp-server

EXPOSE 67 68
CMD ["/bin/sh"]

