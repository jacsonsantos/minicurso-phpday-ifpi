#!/usr/bin/env bash
set -x

php artisan migrate

apachectl -D FOREGROUND