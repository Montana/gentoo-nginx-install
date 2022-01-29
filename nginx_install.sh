#!/usr/bin/bash

eselect profile set 5
emerge --sync
emerge portage

USE="perl python ruby" emerge vim
emerge git ctags layman

echo "source /var/lib/layman/make.conf" >> /etc/make.conf

echo "dev-lang/php cli cgi fpm ctype exif mysql mysqli pdo gd curl xml hash json soap sockets snmp simplexml calendar mhash xmlreader xmlwriter -snmp" > /etc/portage/package.use
echo "www-servers/nginx fastcgi ssl status nginx_modules_http_perl" >> /etc/portage/package.use

emerge nginx php
emerge --config =dev-db/mysql-5.1.56

rc-update add nginx default
rc-update add php-fpm default

emerge gentoolkit htop dstat
