#!/bin/sh

# Start DHCP as a foreground process
/usr/sbin/dhcp -f -lf /bar/lib/dhcp/dhcpd.leases -cf /etc/dhcp/dhcp.conf

