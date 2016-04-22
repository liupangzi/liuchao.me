#!/bin/sh

OPENRESTY_VERSION="1.9.7.4"
PHP_VERSION="7.0.5"
PERCONA_URL="https://www.percona.com/downloads/Percona-Server-5.7/Percona-Server-5.7.11-4/binary/tarball/Percona-Server-5.7.11-4-Linux.x86_64.ssl101.tar.gz"
PERCONA="Percona-Server-5.7.11-4-Linux.x86_64.ssl101"
ES_VERSION="2.3.1"

yum install -y epel-release
yum update -y
yum install -y \
    wget \
    unzip \
    git \
    ntpdate \
    gcc gcc-c++ \
    autoconf \
    iproute \
    libaio libaio-devel \
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

# checkout code && config
mkdir -p /var/www/ /var/log/{nginx,php,mysql,supervisor}
git clone https://github.com/liupangzi/liuchao.me.git /var/www/liuchao.me
chown -R nobody:nobody /var/www/liuchao.me

# os
rm /etc/sysctl.conf && ln -s /var/www/liuchao.me/vps-config/os/sysctl.conf /etc/sysctl.conf
rm /root/.bashrc && ln -s /var/www/liuchao.me/vps-config/os/dotbashrc /root/.bashrc && source /root/.bashrc

# letsencrypt
git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt
/opt/letsencrypt/letsencrypt-auto certonly \
    --text \
    --agree-tos \
    --quiet \
    --non-interactive \
    --authenticator standalone \
    --renew-by-default \
    --rsa-key-size 4096 \
    --email thesedays@126.com \
    --hsts \
    -d liuchao.me \
    -d www.liuchao.me \
    -d 404.liuchao.me \
    -d blog.liuchao.me \
    -d tech.liuchao.me
openssl dhparam -out /etc/letsencrypt/dhparams.pem 4096

# install openresty
wget https://openresty.org/download/openresty-${OPENRESTY_VERSION}.tar.gz -O /data/openresty-${OPENRESTY_VERSION}.tar.gz
cd /data/ && tar zxf openresty-${OPENRESTY_VERSION}.tar.gz
cd /data/openresty-${OPENRESTY_VERSION} \
&& ./configure --prefix=/opt/openresty-${OPENRESTY_VERSION} --with-luajit --with-http_iconv_module \
&& make \
&& make install
ln -s /opt/openresty-${OPENRESTY_VERSION} /opt/openresty
rm -f /opt/openresty/nginx/conf/nginx.conf
ln -s /var/www/liuchao.me/vps-config/openresty/conf/nginx.conf /opt/openresty/nginx/conf/nginx.conf
ln -s /var/www/liuchao.me/vps-config/openresty/conf/servers /opt/openresty/nginx/conf/servers
ln -s /var/www/liuchao.me/vps-config/openresty/conf/common /opt/openresty/nginx/conf/common
chown -R nobody:nobody /opt/openresty*

# install PHP
wget http://hk1.php.net/get/php-${PHP_VERSION}.tar.gz/from/this/mirror -O /data/php-${PHP_VERSION}.tar.gz
cd /data/ && tar zxf php-${PHP_VERSION}.tar.gz
cd /data/php-${PHP_VERSION}/ \
&& ./configure \
    --prefix=/opt/php-${PHP_VERSION} \
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
ln -s /opt/php-${PHP_VERSION} /opt/php
ln -s /var/www/liuchao.me/vps-config/php/php-fpm.conf /opt/php/etc/php-fpm.conf
ln -s /var/www/liuchao.me/vps-config/php/php.ini /opt/php/lib/php.ini
ln -s /var/www/liuchao.me/vps-config/php/cert.pem /opt/php/etc/cert.pem
chown -R nobody:nobody /opt/php*

# install percona
groupadd mysql && useradd mysql -g mysql
wget ${PERCONA_URL} -O /data/${PERCONA}.tar.gz
tar zxf /data/${PERCONA}.tar.gz -C /opt/
ln -s /opt/${PERCONA} /opt/percona-server
rm -f /etc/my.cnf && ln -s /var/www/liuchao.me/vps-config/mysql/my.cnf /etc/my.cnf
/opt/percona-server/bin/mysqld --initialize-insecure
chown -R mysql:mysql /var/log/mysql/ /opt/percona-server /opt/Percona-Server*

# install JDK
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u74-b02/jdk-8u74-linux-x64.tar.gz -O /data/jdk-8u74-linux-x64.tar.gz
tar zxf /data/jdk-8u74-linux-x64.tar.gz -C /opt/
ln -s /opt/jdk1.8.0_74 /opt/jdk
chown -R nobody:nobody /opt/jdk*

# install elasticsearch
groupadd es && useradd es -g es
wget https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/${ES_VERSION}/elasticsearch-${ES_VERSION}.tar.gz -O /data/elasticsearch-${ES_VERSION}.tar.gz
tar zxf /data/elasticsearch-${ES_VERSION}.tar.gz -C /opt/
ln -s /opt/elasticsearch-${ES_VERSION} /opt/elasticsearch

# install elsaticsearch ik plugin
mkdir -p /opt/elasticsearch/plugins/ik
wget https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v1.9.1/elasticsearch-analysis-ik-1.9.1.zip -O /opt/elasticsearch/plugins/ik
cd /opt/elasticsearch/plugins/ik && unzip elasticsearch-analysis-ik-1.9.1.zip

# update elasticsearch synonym config
mkdir -p /opt/elasticsearch/config/analysis
ln -s /var/www/liuchao.me/vps-config/elasticsearch/synonym.txt /opt/elasticsearch/config/analysis/synonym.txt

# install plugin marvel
su es /opt/elasticsearch/bin/plugin install license
su es /opt/elasticsearch/bin/plugin install marvel-agent

chown -R es:es /opt/elasticsearch*

# install kibana
wget https://download.elastic.co/kibana/kibana/kibana-4.5.0-linux-x64.tar.gz -O /data/kibana-4.5.0-linux-x64.tar.gz
tar zxf /data/kibana-4.5.0-linux-x64.tar.gz -C /opt/
ln -s /opt/kibana-4.5.0-linux-x64 /opt/kibana
/opt/kibana/bin/kibana plugin --install elasticsearch/marvel/latest
chown -R es:es /opt/kibana*

# install supervisor
yum install -y python-pip python-meld3
pip install supervisor
ln -s /var/www/liuchao.me/vps-config/supervisor/supervisord.conf /etc/supervisord.conf

# RUN!
chown -R nobody:nobody /var/www/liuchao.me
/usr/bin/supervisord -c /etc/supervisord.conf

# init MySQL data
/opt/percona-server/bin/mysql -uroot < /var/www/liuchao.me/vps-config/mysql/liuchao.me.sql
