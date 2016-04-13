liuchao.me
=============

```
mkdir -p /var/www/ /var/log/liuchao.me/

git clone https://github.com/liupangzi/liuchao.me.git /var/www/liuchao.me

docker build -t "liuchao.me/docker:v1.0" /var/www/liuchao.me/docker

docker run \
    -it \
    -d \
    -p 80:80 \
    -p 443:443 \
    -v /var/www/:/var/www/ \
    -v /var/log/liuchao.me/:/var/log/ \
    liuchao.me/docker:v1.0 \
    supervisord
```
