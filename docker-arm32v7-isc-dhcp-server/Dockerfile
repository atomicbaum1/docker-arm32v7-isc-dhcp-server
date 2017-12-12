#Dockerfile for the arm32v7/isc-dhcp-server container
FROM arm32v7/ubuntu:xenial
MAINTAINER Matthew Baum atomicbaum1@gmail.com

ARG DEBIAN_FRONTEND=noninteractive
# && apt-get -q -y autoremove \
# && apt-get -q -y clean \
# && rm -rf /var/lib/apt/lists/*

# Expose the BOOTP port number
EXPOSE 67

# Environment variables
ENV RUNLEVEL=1 \
    TERM=linux \
    DEBIAN_FRONTEND=noninteractive 

RUN DEBIAN_FRONTEND=noninteractive TERM=linux RUNLEVEL=1 apt-get -q -y update && \
    DEBIAN_FRONTEND=noninteractive TERM=linux RUNLEVEL=1 apt-get -q -y -o "DPkg::Options::=--force-confold" -o "DPkg::Options::=--force-confdef" install apt-utils
# Install the DHCP server 
RUN DEBIAN_FRONTEND=noninteractive TERM=linux RUNLEVEL=1 apt-get -q -y update && \
    DEBIAN_FRONTEND=noninteractive TERM=linux RUNLEVEL=1 apt-get -q -y -o "DPkg::Options::=--force-confold" -o "DPkg::Options::=--force-confdef" install \
      isc-dhcp-server \
      isc-dhcp-server-ldap; \
    touch /var/lib/dhcp/dhcpd.leases

# Copy the support files over
COPY support-files/dhcpd.conf /etc/dhcp/dhcpd.conf
COPY support-files/isc-dhcp-server /etc/default/isc-dhcp-server

# Copy the entry point script and start it
COPY ./entrypoint.sh /sbin/entrypoint.sh
ENTRYPOINT ["/sbin/entrypoint.sh"]
