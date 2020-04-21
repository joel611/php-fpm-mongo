FROM php:7.3-fpm-alpine

RUN apt-get update && apt-get install -y libcurl4-openssl-dev pkg-config libssl-dev
RUN docker-php-ext-install -j$(nproc) pdo_mysql
RUN docker-php-ext-install -j$(nproc) mbstring
RUN pecl install mongodb && \
    docker-php-ext-enable mongodb

WORKDIR /var/www
