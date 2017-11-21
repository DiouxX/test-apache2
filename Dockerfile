# This DockerFile setup a fresh GLPI container
#

FROM debian:latest
MAINTAINER DiouxX "github@diouxx.be"

#Ne pas poser de questions à l'installation
ENV DEBIAN_FRONTEND noninteractive

RUN apt update
RUN apt -y upgrade

#Installation Apache2,PHP et modules necessaire
RUN apt -y install \
	nano \
	apache2 \
	php \
	php-mysql \
	php-ldap \
	php-xmlrpc \
	php-imap \
	curl \
	php-curl \
	php-gd \
	php-mbstring \
	php-xml \
	php-apcu-bc \
	wget

RUN a2enmod rewrite && service apache2 restart

#Exposition des ports
EXPOSE 80 443
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
