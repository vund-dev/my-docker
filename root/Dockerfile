FROM ubuntu:22.04

# Cài đặt common packages
RUN apt-get update
RUN apt-get install software-properties-common ca-certificates lsb-release apt-transport-https -y
RUN add-apt-repository ppa:ondrej/php --yes
RUN add-apt-repository ppa:openswoole/ppa --yes
RUN apt-get update

# Cài đặt tools
RUN apt-get install -yqq curl locate mlocate unzip vim ssh

# Cài đặt nginx, git
RUN apt-get install -y nginx

# Cài đặt php 8.3
RUN apt-get install -y \
    php8.3 \
    php8.3-curl \
    php8.3-mysql \
    php8.3-mbstring \
    php8.3-intl \
    php8.3-gd \
    php8.3-fpm \
    php8.3-common \
    php8.3-cli \
    php8.3-igbinary \
    php8.3-redis \
    php8.3-gmp \
    php8.3-sqlite3 \
    php8.3-xdebug \
    php8.3-bcmath \
    php8.3-dom \
    php8.3-rdkafka \
    php8.3-mongodb \
    php8.3-swoole \
    php8.3-zip

COPY bootstrap.sh /bootstrap.sh
RUN chmod +x /bootstrap.sh

WORKDIR /var/www/services

# Cài đặt composer
COPY ./composer/ /usr/local/composer
RUN chmod +x /usr/local/composer/composer-install.sh && sh /usr/local/composer/composer-install.sh

# Thay đổi group user_id
RUN usermod -u 1000 www-data && groupmod -g 1000 www-data

ENTRYPOINT sh /bootstrap.sh && bash
