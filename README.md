# docker-arm32v7-isc-dhcp-server

This is a project to bring the ISC DHCP server to a Raspberry Pi 3 docker container.

# Commands to get this to work
```docker build -t docker-raspberry-pi-3-isc-dhcp-server .```

```docker network create --subnet=10.0.0.0/24 homenet```

```docker run --net homenet --ip 10.0.0.2 --name dhcp-server docker-raspberry-pi-3-isc-dhcp-server```

# About
Maintained by Matthew Baum
