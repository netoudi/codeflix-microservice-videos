FROM php:7.4-fpm-alpine

RUN apk update
RUN apk add --no-cache \
    openssl \
    bash \
    vim \
    nodejs \
    npm \
    mysql-client \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev

RUN touch /root/.bashrc | echo "PS1='\w \$ '" >> /root/.bashrc

RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install -j$(nproc) gd

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

WORKDIR /var/www
RUN rm -rf /var/www/html

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# composer parallel install plugin
RUN composer global require hirak/prestissimo

EXPOSE 9000
ENTRYPOINT ["php-fpm"]
