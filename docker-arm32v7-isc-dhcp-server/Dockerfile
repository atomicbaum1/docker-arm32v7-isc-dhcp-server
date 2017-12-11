# Dockerfile for the arm32v7/isc-dhcp-server container
FROM arm32v7/ubuntu:xenial
MAINTAINER Matthew Baum atomicbaum1@gmail.com

# Environment variables
## DEBIAN_FRONTEND: Disalbe the apt-get interactive post-install setup
## __SUPPORT_FILES_ROOT_DIR: Support file direcotry
ENV DEBIAN_FRONTEND=noninteractive \
    __SUPPORT_FILES_ROOT_DIR=support-files 

# Copy entrypoint
COPY ./entrypoint.sh ./entrypoint.sh

# Copy support files over to the tmp directory
CMD ["mkdir", "/tmp/$__SUPPORT_FILES_ROOT_DIR"]

# RUN Commands
## Update the software
## Install slapd and ldap-utils (ignore dpkg config errors - we config manually)
## Clean up unused files
#RUN apt-get update; \
#    apt-get -y install \
#        slapd \
#        ldap-utils
#    apt-get clean \
#    && rm -rf /var/lib/apt/lists/*

# Expose the BOOTP port number 
EXPOSE 67

# Start the entrypoint
ENTRYPOINT ["./entrypoint.sh"]
