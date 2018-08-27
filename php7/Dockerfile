FROM php:7-fpm-alpine3.7
 
COPY exts /tmp/php-exts

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories

RUN apk add --no-cache autoconf gcc g++ make git

RUN apk add --no-cache freetype libpng libjpeg-turbo libmcrypt libtool

RUN docker-php-ext-install iconv pdo_mysql

RUN apk add --no-cache zlib-dev \
    && docker-php-ext-install zip\
    && apk del zlib-dev

RUN apk add --no-cache freetype-dev libpng-dev libjpeg-turbo-dev && \
  docker-php-ext-configure gd \
    --with-gd \
    --with-freetype-dir=/usr/include/ \
    --with-png-dir=/usr/include/ \
    --with-jpeg-dir=/usr/include/ && \
  docker-php-ext-install -j$(getconf _NPROCESSORS_ONLN) gd && \
  apk del --no-cache freetype-dev libpng-dev libjpeg-turbo-dev

RUN apk add --no-cache imagemagick-dev imagemagick\
    && pecl install /tmp/php-exts/imagick*.tgz \
    && docker-php-ext-enable imagick \
    && apk del --no-cache imagemagick-dev 

RUN apk add --no-cache libmcrypt-dev \
    && pecl install /tmp/php-exts/mcrypt*.tgz \
    && docker-php-ext-enable mcrypt \
    && apk del --no-cache libmcrypt-dev

RUN pecl install /tmp/php-exts/redis*.tgz /tmp/php-exts/mongodb*.tgz \
    && docker-php-ext-enable redis mongodb

RUN apk add --no-cache wget \
    && wget https://getcomposer.org/download/1.6.5/composer.phar \
    && mv composer.phar /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer \
    && composer config -g repo.packagist composer https://packagist.phpcomposer.com \
    && apk del wget

RUN echo -e 'xdebug.remote_enable=1\nxdebug.remote_host=host.docker.internal\nxdebug.remote_port=9000\nxdebug.idekey=PHPSTORM' >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

RUN adduser -D -u 1000 alitain

USER alitain

WORKDIR /var/www

CMD ["php-fpm"]

EXPOSE 9000
