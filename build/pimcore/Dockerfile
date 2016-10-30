FROM debian:jessie
MAINTAINER pimcore GmbH <info@pimcore.com>

ADD sources.list /tmp/sources.list

RUN apt-get update && \
 DEBIAN_FRONTEND=noninteractive apt-get -y upgrade && \
 DEBIAN_FRONTEND=noninteractive apt-get -y install wget sudo supervisor pwgen apt-utils && \
 cat /tmp/sources.list > /etc/apt/sources.list && \
 wget -O - http://www.dotdeb.org/dotdeb.gpg | apt-key add - && \
 apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install \
 php7.0-fpm php7.0-cli php7.0-curl php7.0-dev php7.0-gd php7.0-imagick php7.0-imap \
 php7.0-intl php7.0-mcrypt php7.0-memcache php7.0-mysql php7.0-sqlite php7.0-redis \
 php7.0-bz2 php7.0-ldap php7.0-xml bzip2 unzip memcached ntpdate libxrender1 libfontconfig1 \
 imagemagick inkscape build-essential libssl-dev rcconf sudo lynx autoconf \
 libmagickwand-dev pngnq pngcrush xvfb cabextract libfcgi0ldbl poppler-utils rsync \
 xz-utils libreoffice python-uno libreoffice-math xfonts-75dpi jpegoptim monit \
 aptitude pigz libtext-template-perl mailutils git-core curl mariadb-client \
 apache2 libapache2-mod-fastcgi && apt-get build-dep ghostscript -y && \
 apt-get clean && rm -rf /var/lib/apt/lists/*

# configure apache
RUN a2dismod -f cgi autoindex mpm_worker mpm_prefork
RUN a2enmod rewrite actions fastcgi alias status filter expires headers setenvif proxy proxy_fcgi socache_shmcb mpm_event ssl
RUN rm /etc/apache2/sites-enabled/* 
RUN rm -r /var/www/* 
RUN chown -R www-data:www-data /var/www
ADD vhost.conf /etc/apache2/sites-enabled/000-default.conf

# configure php-fpm
RUN rm -r /etc/php/7.0/cli/php.ini
RUN rm -r /etc/php/7.0/fpm/php.ini
ADD php.ini /etc/php/7.0/fpm/php.ini 
RUN ln -s /etc/php/7.0/fpm/php.ini /etc/php/7.0/cli/php.ini
RUN mv /etc/php/7.0/fpm/pool.d/www.conf /etc/php/7.0/fpm/pool.d/www.conf.dist 
ADD www-data.conf /etc/php/7.0/fpm/pool.d/www-data.conf

# install tools
RUN wget "http://download.gna.org/wkhtmltopdf/0.12/0.12.2.1/wkhtmltox-0.12.2.1_linux-jessie-amd64.deb" -O wkhtmltopdf-0.12.deb && dpkg -i wkhtmltopdf-0.12.deb
ADD install-ghostscript.sh /tmp/install-ghostscript.sh
ADD install-ffmpeg.sh /tmp/install-ffmpeg.sh
RUN chmod 755 /tmp/*.sh
RUN /tmp/install-ghostscript.sh
RUN /tmp/install-ffmpeg.sh 

# setup startup scripts
ADD start-apache.sh /start-apache.sh
ADD start-php-fpm.sh /start-php-fpm.sh
ADD run.sh /run.sh
RUN chmod 755 /*.sh
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ENV REDIS_HOST=redis
ENV MYSQL_DATABASE=pimcore_demo_pimcore
ENV MYSQL_USER=pimcore_demo
ENV MYSQL_PASSWORD=secretpasswordh
ENV MYSQL_RANDOM_ROOT_PASSWORD=yes

# pimcore config files
ADD cache.php /tmp/cache.php

ADD system.php /tmp/system.php
# ports
EXPOSE 80

# volumes
VOLUME ["/var/www"]

CMD ["/run.sh"]
	
