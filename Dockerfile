FROM php:7.3-fpm-alpine

RUN apk --update add --virtual build-dependencies build-base openssl-dev autoconf \
  && pecl install mongodb \
  && docker-php-ext-enable mongodb \
  && apk del build-dependencies build-base openssl-dev autoconf \
  && rm -rf /var/cache/apk/*

# RUN apk-get update && apk-get install -y libcurl4-openssl-dev pkg-config libssl-dev
RUN docker-php-ext-install -j$(nproc) pdo_mysql
RUN docker-php-ext-install -j$(nproc) mbstring

WORKDIR /var/www
