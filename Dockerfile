FROM php:8.1-fpm-alpine AS php

# Package installation
RUN apk add --no-cache $PHPIZE_DEPS git build-base zsh nodejs npm bash

# Php extension installation
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/
RUN install-php-extensions xsl pdo_pgsql intl redis amqp pgsql @composer

# Oh my zsh installation
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Symfony binary installation
RUN wget https://get.symfony.com/cli/installer -O - | bash && mv /root/.symfony/bin/symfony /usr/local/bin/symfony

COPY docker/php.ini /usr/local/etc/php/conf.d/

WORKDIR /srv/app

COPY . .

EXPOSE 9000
CMD ["php-fpm"]


FROM nginx:alpine as nginx

WORKDIR /srv/app
COPY docker/nginx.conf /etc/nginx/
COPY --from=php /srv/app /srv/app

HEALTHCHECK --interval=1m --timeout=30s --retries=3 CMD curl --fail http://localhost:80/elb-status || exit 1
CMD ["nginx"]
EXPOSE 80