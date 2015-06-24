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
        ENVIRONEMENT: dev
```

## ENV vars

* DOCUMENT_ROOT defaults to /var/www/app/web
* ENVIRONEMENT defaults to dev


## Older PHP version

```
```
apache:
    image: yappabe/apache-php:5.4
```
