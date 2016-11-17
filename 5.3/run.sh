#!/bin/bash

# Apache gets grumpy about PID files pre-existing
rm -f /var/run/apache2/apache2.pid && \
sed -i "s|DOCUMENT_ROOT|$DOCUMENT_ROOT|g" /etc/apache2/sites-available/default && \
sed -i "s|ENVIRONMENT_VAR|$ENVIRONMENT|g" /etc/apache2/sites-available/default && \
sed -i "s|PHP_ERROR_REPORTING_VAR|$PHP_ERROR_REPORTING|g" /etc/php5/apache2/conf.d/php.ini && \
sed -i "s|PHP_ERROR_REPORTING_VAR|$PHP_ERROR_REPORTING|g" /etc/php5/cli/conf.d/php.ini && \
/usr/sbin/apache2ctl -D FOREGROUND
