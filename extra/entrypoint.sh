#!/usr/bin/env bash
set -x

if [ ! -f .env ]; then
    cp .env.example .env
    php artisan key:generate

    # Caminho para o arquivo .env
    ENV_FILE=".env"

    # Substituições
    sed -i 's/APP_NAME=Laravel/APP_NAME=Exemplo/' $ENV_FILE
    sed -i 's/APP_ENV=local/APP_ENV=production/' $ENV_FILE
    sed -i 's/APP_DEBUG=true/APP_DEBUG=false/' $ENV_FILE
    sed -i 's|APP_URL=http://localhost|APP_URL=http://contatopesqquisa.online|' $ENV_FILE
fi

php artisan migrate

apachectl -D FOREGROUND