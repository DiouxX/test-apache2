# This DockerFile setup a fresh GLPI container
#

FROM debian:latest
MAINTAINER DiouxX "github@diouxx.be"

#Ne pas poser de questions à l'installation
ENV DEBIAN_FRONTEND noninteractive

RUN apt update
RUN apt -y upgrade

#Installation Apache2,PHP et modules necessaire
RUN apt install -y apache2

RUN apt install -y \
	wget \
	php5 \
	php5-mysql \
	php5-ldap \
	php5-xmlrpc \
	php5-imap \
	curl \
	php5-curl\
	php5-gd

RUN a2enmod rewrite && service apache2 restart

#Exposition des ports
EXPOSE 80 443
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
