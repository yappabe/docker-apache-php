![Docker pulls](https://img.shields.io/docker/pulls/yappabe/apache-php.svg?style=flat)
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


## How to use a different PHP version

Append one of the available version numbers to the image name.

### Example:

```
apache:
    image: yappabe/apache-php:5.4
```

### Available versions

- 5.6
- 5.5
- 5.4
- 5.3
- 5.2
