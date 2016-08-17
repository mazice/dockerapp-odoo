FROM phusion/baseimage:0.9.18
MAINTAINER Miguel Bustos <mbustos@folderit.net>

# Set correct environment variables
ENV DEBIAN_FRONTEND="noninteractive" HOME="/root" LC_ALL="C.UTF-8" LANG="en_US.UTF-8" LANGUAGE="en_US.UTF-8" POSTGRES_USER="odoo" POSTGRES_PASSWORD="odoo"

# Install Plex
ADD install.sh /
RUN bash /install.sh

# Define /config in the configuration file not using environment variables
ADD odoo80 /etc/default/odoo80

VOLUME /config
VOLUME /data

EXPOSE 8989

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]
