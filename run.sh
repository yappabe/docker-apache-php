#!/bin/bash

sed -i "s|DOCUMENT_ROOT|$DOCUMENT_ROOT|g" /etc/apache2/sites-available/000-default.conf && \
/usr/sbin/apache2ctl -D FOREGROUND