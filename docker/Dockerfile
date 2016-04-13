# This dockerfile uses the CentOS 7 image
# VERSION 1 - EDITION 2
# Author: liuchao

FROM centos:7.2.1511
MAINTAINER liuchao "thesedays@126.com"
ENV OPENRESTY_VERSION 1.9.7.4
ENV PHP_VERSION 7.0.5

# add epel
RUN yum install -y epel-release

# update OS
RUN yum update -y
# install deps
RUN yum install -y \
    wget \
    git \
    ntpdate \
    gcc gcc-c++ \
    autoconf \
    iproute \
    libcurl libcurl-devel \
    libxml2 libxml2-devel \
    openssl openssl-devel \
    readline readline-devel \
    pcre pcre-devel \
    zlib zlib-devel \
    libpng libpng-devel \
    freetype freetype-devel \
    libjpeg-turbo libjpeg-turbo-devel \
    libvpx libvpx-devel \
    fontconfig fontconfig-devel \
    libXpm libXpm-devel \
    libtiff libtiff-devel \
    libmcrypt libmcrypt-devel \
    gd gd-devel \
    libicu libicu-devel

RUN mkdir -p /data/

# intsall letsencrypt
RUN cd /data/ \
 && git clone https://github.com/letsencrypt/letsencrypt
COPY letsencrypt/cli.ini /data/letsencrypt/cli.ini
RUN /data/letsencrypt/letsencrypt-auto certonly \
    --agree-tos \
    --renew-by-default \
    -c /data/letsencrypt/cli.ini
RUN openssl dhparam -out /etc/letsencrypt/dhparams.pem 2048

# install openresty
RUN mkdir -p /var/log/nginx/
RUN wget https://openresty.org/download/openresty-$OPENRESTY_VERSION.tar.gz \
    -O /data/openresty-$OPENRESTY_VERSION.tar.gz
RUN cd /data/ \
 && tar zxf openresty-$OPENRESTY_VERSION.tar.gz
RUN cd /data/ngx_openresty-$OPENRESTY_VERSION \
 && ./configure \
    --prefix=/opt/openresty-$OPENRESTY_VERSION \
    --with-luajit \
    --with-http_iconv_module \
 && make \
 && make install
RUN  ln -s /opt/openresty-$OPENRESTY_VERSION /opt/openresty
COPY openresty/conf/nginx.conf /opt/openresty/nginx/conf/nginx.conf
COPY openresty/conf/servers /opt/openresty/nginx/conf/servers
COPY openresty/conf/wordpress /opt/openresty/nginx/conf/wordpress

# install PHP
RUN mkdir -p /var/log/php/
RUN wget http://hk1.php.net/get/php-$PHP_VERSION.tar.gz/from/this/mirror \
    -O /data/php-$PHP_VERSION.tar.gz
RUN cd /data/ \
 && tar zxf php-$PHP_VERSION.tar.gz
RUN cd /data/php-$PHP_VERSION/ \
 && ./configure \
    --prefix=/opt/php-$PHP_VERSION \
    --enable-fpm \
    --with-fpm-user=nobody \
    --with-fpm-group=nobody \
    --with-pear \
    --with-zlib \
    --with-pcre-regex \
    --with-gd \
    --with-mysqli=mysqlnd \
    --with-pdo-mysql=mysqlnd \
    --enable-xml \
    --enable-bcmath \
    --with-curl \
    --with-mcrypt \
    --enable-sockets \
    --with-xmlrpc \
    --enable-zip \
    --enable-soap \
    --enable-mbstring \
    --enable-exif \
    --enable-pcntl \
    --enable-intl \
    --with-openssl \
    --with-freetype-dir=/usr/include/freetype2 \
 &&  make \
 &&  make install
RUN  ln -s /opt/php-$PHP_VERSION /opt/php

# install PHP redis
RUN cd /data/ \
 && git clone https://github.com/phpredis/phpredis.git --branch php7
RUN cd /data/phpredis \
 && /opt/php/bin/phpize \
 && ./configure --with-php-config=/opt/php/bin/php-config \
 && make \
 && make install

# init PHP config files
COPY php/php-fpm.conf /opt/php/etc/php-fpm.conf
COPY php/php.ini /opt/php/lib/php.ini
COPY php/cert.pem /opt/php/etc/cert.pem
