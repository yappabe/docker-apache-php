# Yappa Apache PHP Docker Image

## Usage

Add the following to your docker-compose.yml file:

```
apache:
    image: yappabe/apache-php
    links:
        - mysql
    volumes_from:
        - app
    environment:
        DOCUMENT_ROOT: /var/www/app/web
        ENVIRONMENT: dev
```

## ENV vars

* DOCUMENT_ROOT defaults to /var/www/app/web
* ENVIRONMENT defaults to dev


## How to use PHP 5.4

```
apache:
    image: yappabe/apache-php:5.4
```
