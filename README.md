## Deploy Production

## Setup Deploy Laravel

```
cp .env.example .env
php artisan key:generate
php artisan migrate
chmod -R 777 storage
```

### Como instalar o Docker (VPS)

```
apt-get update
cd /tmp
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
apt-get install docker-compose-plugin
docker compose version
```

### Cria htpassword para Phpmyadmin

```
apt install apache2-utils
htpasswd -c .htpasswd username
```

## Inicializar aplicação

```
cd /path/to/your-app && \
docker-compose -f docker-compose-prod.yml --env-file ./environment build --no-cache && \
docker compose -f docker-compose-prod.yml --env-file ./environment up -d && \
docker system prune -f
```