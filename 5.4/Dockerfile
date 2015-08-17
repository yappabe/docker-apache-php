FROM debian:wheezy

MAINTAINER Joeri Verdeyen <joeriv@yappa.be>

ENV DOCUMENT_ROOT /var/www/app/html
ENV ENVIRONMENT dev

RUN \
  apt-get update && \
  apt-get install -y \
    curl \
    wget \
    git \
    iptables \
    apache2 \
    php5 \
    php5-mysql \
    php5-mysql \
    php5-mcrypt \
    php5-gd \
    php5-memcached \
    php5-curl \
    php-pear \
    php-apc \
    php5-cli \
    php5-curl \
    php5-mcrypt \
    php5-sqlite \
    php5-intl \
    php5-tidy \
    php5-imap \
    php5-imagick \
    php5-json \
    php5-imagick \
    libapache2-mod-php5 && \
  a2enmod proxy && \
  a2enmod proxy_http && \
  a2enmod alias && \
  a2enmod dir && \
  a2enmod env && \
  a2enmod mime && \
  a2enmod reqtimeout && \
  a2enmod rewrite && \
  a2enmod status && \
  a2enmod filter && \
  a2enmod deflate && \
  a2enmod setenvif && \
  a2enmod vhost_alias && \
  a2enmod ssl && \
  apt-get autoremove -y && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN echo Europe/Brussels > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

RUN ln -sf /dev/stderr /var/log/apache2/error.log

COPY dummy.crt  /etc/ssl/crt/dummy.crt
COPY dummy.key  /etc/ssl/crt/dummy.key
COPY default.conf /etc/apache2/sites-available/default
COPY php.ini    /etc/php5/apache2/conf.d/
COPY php.ini    /etc/php5/cli/conf.d/
COPY run.sh run.sh

RUN chmod +x run.sh

EXPOSE 80
EXPOSE 443

CMD ["./run.sh"]
