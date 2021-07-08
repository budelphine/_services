# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: budelphi <budelphi@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/14 18:38:20 by budelphi          #+#    #+#              #
#    Updated: 2021/04/15 15:38:12 by budelphi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# -----------------------------------------------------> alpine
# Use alpine 3.12 
FROM alpine:3.12

# Add packages
RUN apk update 
RUN apk add supervisor nginx mysql openssl
RUN apk add php7 php7-fpm php7-phar php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

# Debug Alpine
RUN mkdir -p /var/www/html/
RUN mkdir -p /run/nginx
RUN mkdir -p /run/php7

# -----------------------------------------------------> copy default conf

COPY ./pma-nginx.conf /etc/nginx/conf.d/default.conf
COPY ./supervisord.conf /etc/supervisord.conf

# -----------------------------------------------------> run pma

# download && run pma
RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.1-all-languages.tar.gz
RUN tar -xvf phpMyAdmin-5.0.1-all-languages.tar.gz --strip-components 1 -C /var/www/html/
COPY ./phpmyadmin.inc.php /var/www/html/config.inc.php

# make tmp dir
RUN mkdir -p /var/www/html/tmp
RUN chmod 777 /var/www/html/tmp

# -----------------------------------------------------> nginx - ssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:2048 -x509 -days 365 -nodes -subj "/C=RU/ST=Kazan/L=Kazan/O=21School/OU=budelphi/CN=html" -out /etc/nginx/ssl/html.pem -keyout /etc/nginx/ssl/html.key

# -----------------------------------------------------> run container

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

EXPOSE 5000
