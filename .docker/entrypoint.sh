#!/bin/bash

#On error no such file entrypoint.sh, execute in terminal - dos2unix .docker\entrypoint.sh

### FRONTEND ###
# config npm cache
npm config set cache /var/www/.docker/.cache/npm --global

# install dependencies
cd /var/www/frontend && npm install && cd ..

if [ ! -f "/var/www/frontend/.env" ]; then
  cp /var/www/frontend/.env.example /var/www/frontend/.env
fi

### BACKEND ###
cd /var/www/backend

if [ ! -f ".env" ]; then
  cp .env.example .env
fi

if [ ! -f ".env.testing" ]; then
  cp .env.testing.example .env.testing
fi

composer install
php artisan key:generate
php artisan migrate

php-fpm
