# @version 4.0.0
# Configures NGINX .

FROM nginx:1.19.1-alpine
LABEL maintainer="marcosfreitas@c4network.com.br"

# @todo change user to not run as root
#RUN apk add --no-cache shadow &&\
#    usermod -u 1000 nginx

#USER nginx

EXPOSE 80
# @todo not prepared to work with SSL connections yet
EXPOSE 443

# @bug misconfiguration, should be tested
#RUN cd / &&\
#    wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh &&\
#    chmod +x wait-for-it.sh

RUN rm /etc/nginx/nginx.conf && rm /etc/nginx/conf.d/default.conf && ls /etc/nginx/conf.d/

# From the context of this Dockerfile
# moved with .tmpl suffix because dockerize
# @todo change it back, because I won't use this functionality of dockerize
ADD /nginx/templates/nginx.conf.tmpl /etc/nginx/nginx.conf.tmpl
#ADD /nginx/templates/nginx.conf.tmpl /etc/nginx/nginx.conf

# Installing dockerize
RUN apk update && apk add --no-cache openssl shadow bash

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/${DOCKERIZE_VERSION}/dockerize-alpine-linux-amd64-${DOCKERIZE_VERSION}.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-${DOCKERIZE_VERSION}.tar.gz \
    && rm dockerize-alpine-linux-amd64-${DOCKERIZE_VERSION}.tar.gz

# @bug problem with folder's permissions
#ADD conf/vhost-app.conf /etc/nginx/sites-available/app
#RUN mkdir -p /etc/nginx/sites-enabled &&\
#    mkdir -p /etc/nginx/templates &&\
#    chmod 751 -R /etc/nginx &&\
#    ls -l /etc/nginx/ &&\
#    ln -s /etc/nginx/sites-available/app /etc/nginx/sites-enabled/app

# @bug problem with relative paths
#RUN rm -rf /var/www/html
#VOLUME /../../www /var/www/html
#VOLUME /../../.docker/nginx/templates /etc/nginx/templates

CMD ["nginx", "-g", "daemon off;"]