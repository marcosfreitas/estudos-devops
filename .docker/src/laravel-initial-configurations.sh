#!/bin/bash

cd /var/www/html;

if [[ -f 'composer.json' ]]; then
    echo "-- Running composer install";
    composer install;
fi;

CONTAINER_ALREADY_STARTED="CONTAINER_ALREADY_RAN_ONCE"

if [[ ! -e $CONTAINER_ALREADY_STARTED && -f 'artisan' ]]; then
    touch $CONTAINER_ALREADY_STARTED

    echo "-- Running this container first its very first time"

    chmod a+rw -R /var/www/;

    cp .env.example .env;

    echo "-- Generating key";

    php artisan key:generate;
    php artisan config:cache;

    chmod a+rw -R /var/www/;

    composer dump-autoload;

    php artisan migrate;
	php artisan db:seed;

    chmod a+rw -R /var/www/;

else
    echo "-- Container already run, no need to be reconfigured or Laravel is not installed"
fi

echo "-- Services running";

php-fpm;