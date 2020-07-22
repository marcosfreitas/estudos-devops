FROM php:7.4-fpm-alpine

ARG APP_ENVIROMENT

EXPOSE 9000

# @info fix permissions
# Use the default production configuration
RUN echo ${APP_ENVIROMENT} &&\
    apk update && apk add --no-cache shadow bash composer &&\
    usermod -u 1000 www-data &&\
    mv "$PHP_INI_DIR/php.ini-$APP_ENVIROMENT" "$PHP_INI_DIR/php.ini" &&\
    docker-php-ext-install mysqli pdo_mysql &&\
    php-fpm -m

COPY /src/ /usr/share/.docker/src

RUN chmod +x  /usr/share/.docker/src/*.sh &&\
    mkdir -p /var/www/html &&\
    bash /usr/share/.docker/src/set-right-permissions-by-path.sh /var/www/ &&\
    bash /usr/share/.docker/src/set-right-permissions-by-path.sh /var/www/html

WORKDIR /var/www/html

USER www-data

ENTRYPOINT [ "/usr/share/.docker/src/laravel-initial-configurations.sh" ]