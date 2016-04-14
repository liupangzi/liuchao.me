# This dockerfile uses the CentOS 7 image
# VERSION 1 - EDITION 3
# Author: liuchao

FROM centos:7.2.1511
MAINTAINER liuchao "thesedays@126.com"
ENV OPENRESTY_VERSION 1.9.7.4
ENV PHP_VERSION 7.0.5
ENV PERCONA_URL https://www.percona.com/downloads/Percona-Server-5.7/Percona-Server-5.7.11-4/binary/tarball/Percona-Server-5.7.11-4-Linux.x86_64.ssl101.tar.gz
ENV PERCONA Percona-Server-5.7.11-4-Linux.x86_64.ssl101

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

# install openresty
RUN mkdir -p /var/log/nginx/
RUN wget https://openresty.org/download/openresty-$OPENRESTY_VERSION.tar.gz \
    -O /data/openresty-$OPENRESTY_VERSION.tar.gz
RUN cd /data/ \
 && tar zxf openresty-$OPENRESTY_VERSION.tar.gz
RUN cd /data/openresty-$OPENRESTY_VERSION \
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
COPY php/php-fpm.conf /opt/php/etc/php-fpm.conf
COPY php/php.ini /opt/php/lib/php.ini
COPY php/cert.pem /opt/php/etc/cert.pem

# install PHP redis
RUN cd /data/ \
 && git clone https://github.com/phpredis/phpredis.git --branch php7
RUN cd /data/phpredis \
 && /opt/php/bin/phpize \
 && ./configure --with-php-config=/opt/php/bin/php-config \
 && make \
 && make install

# install percona
RUN mkdir -p /var/log/mysql/ /var/lib/mysql/
RUN wget $PERCONA_URL -O /data/
RUN tar zxf /data/$PERCONA.tar.gz -C /opt/
RUN ln -s /opt/$PERCONA /opt/percona-server
COPY mysql/my.cnf /etc/my.cnf
RUN /opt/percona-server/bin/mysqld --initialize-insecure
RUN chown -R mysql:mysql /var/log/mysql/
RUN /opt/percona-server/bin/mysql -uroot -e "create database blog_liuchao_me;"
RUN /opt/percona-server/bin/mysql -uroot -e "create database tech_liuchao_me;"
RUN /opt/percona-server/bin/mysql -uroot blog_liuchao_me < /var/www/liuchao.me/blog/data/blog_liuchao_me.sql
RUN /opt/percona-server/bin/mysql -uroot tech_liuchao_me < /var/www/liuchao.me/tech/data/tech_liuchao_me.sql

# install supervisor
RUN yum install -y python-pip python-meld3
RUN pip install supervisor
COPY supervisor/supervisord.conf /etc/supervisord.conf

EXPOSE 80 443
VOLUME ["/var/www", "/var/log/nginx", "var/log/php", "var/log/mysql", "/var/log/supervisor", "etc/letsencrypt", "/var/lib/letsencrypt"]

CMD /usr/bin/supervisord -c /etc/supervisord.conf
