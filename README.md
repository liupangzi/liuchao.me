liuchao.me
=============

### install.sh
```
mkdir -p /var/www/ /var/log/{nginx,php,mysql,supervisor}

git clone https://github.com/liupangzi/liuchao.me.git /var/www/liuchao.me

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

curl -fsSL https://get.docker.com/ | sh
usermod -aG docker nobody

docker build -t "liuchao.me/docker:v1.0" /var/www/liuchao.me/docker
docker run -it -d liuchao.me/docker:v1.0
```
