FROM php:8.2.1-apache

ENV WORKDIR=/var/www

RUN apt update && apt upgrade -y && apt install -y zip unzip curl git nano sudo

## Install Certbot and dependencies
RUN apt update && apt install -y certbot python3-certbot-apache

WORKDIR ${WORKDIR}
COPY . ${WORKDIR}

## Install PHP ext Intl
RUN apt install -y libicu-dev\
&& docker-php-ext-configure intl\
&& docker-php-ext-install intl
## Installing php extensions
RUN apt-get install -y \
        libzip-dev \
        zip \
  && docker-php-ext-install zip
RUN apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd
## Installing php extensions
RUN docker-php-ext-install pdo_mysql
## Installing Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer -n install
## Installing NodeJS LTS v18
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - &&\
    apt install -y nodejs
## Installing Yarn
RUN npm install --global yarn
RUN npm install
RUN npm run build
## Apache2
COPY extra/apache2-conf/00-aniversario-app.conf /etc/apache2/sites-available/
# COPY extra/apache2-conf/00-aniversario-app-le-ssl.conf /etc/apache2/sites-available/
RUN a2enmod rewrite \
    && a2enmod headers \
    && a2enmod ssl \
    && a2ensite 00-aniversario-app \
    # && a2ensite 00-aniversario-app-le-ssl \
    && a2dissite 000-default

EXPOSE 80 443

ENTRYPOINT [ "./extra/entrypoint.sh" ]