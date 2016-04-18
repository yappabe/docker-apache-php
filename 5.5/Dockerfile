FROM debian:wheezy

MAINTAINER Joeri Verdeyen <joeriv@yappa.be>

ENV DOCUMENT_ROOT /var/www/app/html
ENV ENVIRONMENT dev

RUN \
  apt-get update && \
  apt-get install -y \
  wget

RUN echo "deb http://packages.dotdeb.org wheezy-php55 all" >> /etc/apt/sources.list.d/dotdeb.org.list && \
    echo "deb-src http://packages.dotdeb.org wheezy-php55 all" >> /etc/apt/sources.list.d/dotdeb.org.list && \
    wget -O- http://www.dotdeb.org/dotdeb.gpg | apt-key add -

RUN \
  apt-get update && \
  apt-get install -y \
    curl \
    wget \
    vim \
    git \
    locales \
    iptables \
    apache2 \
    php5 \
    php5-mysql \
    php5-mysql \
    php5-mcrypt \
    php5-gd \
    php5-memcache \
    php5-curl \
    php-pear \
    php5-apcu \
    php5-cli \
    php5-curl \
    php5-mcrypt \
    php5-sqlite \
    php5-intl \
    php5-tidy \
    php5-imap \
    php5-json \
    php5-imagick \
    php5-common \
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
  a2enmod php5 && \
  apt-get autoremove -y && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN echo Europe/Brussels > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

RUN echo 'de_DE ISO-8859-1\n\
de_DE.UTF-8 UTF-8\n\
de_DE@euro ISO-8859-15\n\
en_GB ISO-8859-1\n\
en_GB.ISO-8859-15 ISO-8859-15\n\
en_US ISO-8859-1\n\
en_US.ISO-8859-15 ISO-8859-15\n\
en_US.UTF-8 UTF-8\n\
fr_FR ISO-8859-1\n\
fr_FR.UTF-8 UTF-8\n\
fr_FR@euro ISO-8859-15\n\
nl_BE ISO-8859-1\n\
nl_BE.UTF-8 UTF-8\n\
nl_BE@euro ISO-8859-15\n\
nl_NL ISO-8859-1\n\
nl_NL.UTF-8 UTF-8\n\
nl_NL@euro ISO-8859-15\n'\
>> /etc/locale.gen &&  \
usr/sbin/locale-gen

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
