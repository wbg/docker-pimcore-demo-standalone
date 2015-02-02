FROM google/debian:wheezy
MAINTAINER pimcore GmbH <info@pimcore.com>

ADD sources.list /sources.list
RUN cat sources.list >> /etc/apt/sources.list 

# Install packages
RUN apt-get update && \
 DEBIAN_FRONTEND=noninteractive apt-get -y upgrade && \
 DEBIAN_FRONTEND=noninteractive apt-get -y install apt-get install \
 php5-fpm php5-cli php5-curl php5-dev php5-gd php5-imagick php5-imap \
 php5-intl php5-mcrypt php5-memcache php5-mysql php5-sqlite php5-redis \
 bzip2 unzip libxrender1 libfontconfig1 imagemagick \
 build-essential libssl-dev sudo lynx autoconf libmagickwand-dev \
 pngnq pngcrush xvfb cabextract libfcgi0ldbl poppler-utils

RUN apt-get -y -t wheezy-backports install libreoffice python-uno libreoffice-math

RUN apt-get -y install apache2-mpm-worker libapache2-mod-fastcgi
 
# Override default apache conf
ADD vhost.conf /etc/apache2/sites-enabled/default

# Enable apache rewrite module
RUN a2enmod rewrite


EXPOSE 80
#CMD ["/run.sh"]