liuchao.me
=============

```
mkdir -p /var/www/ /var/log/liuchao.me/
cd /var/www/ && git clone https://github.com/liupangzi/liuchao.me.git
cd /var/www/liuchao.me/docker && docker build -t "liuchao.me/docker:v1.0" .

docker run \
    -it \
    -d \
    -p 80:80 \
    -v /var/www/:/var/www/ \
    -v /var/log/liuchao.me/:/var/log/ \
    liuchao.me/docker:v1.0 \
    supervisord
```
