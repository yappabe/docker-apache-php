# Yappa Apache PHP Docker Image

## Usage

Add the following to your docker-compose.yml file:

```
apache:
    image: yappabe/apache-php
    ports:
        - 80:80
    links:
        - mysql
    volumes_from:
        - app
    environment:
        DOCUMENT_ROOT: /var/www/app/web
```

## ENV vars

* DOCUMENT_ROOT defaults to /var/www/app/web

## Older PHP version
