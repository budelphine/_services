# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: budelphi <budelphi@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/10 19:42:09 by budelphi          #+#    #+#              #
#    Updated: 2021/04/24 16:55:57 by budelphi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# -----------------------------------------------------> alpine
# Use alpine 3.12 
FROM alpine:3.12

# Add packages
RUN apk update 
RUN apk add nginx openssl curl mariadb mariadb-client supervisor
RUN apk add php7 php7-fpm php7-phar php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

# # Debug Alpine 1
# RUN	mkdir -p /run/mysqld
# RUN chown -R mysql /run/mysqld

# Debug Alpine 2
RUN mkdir -p /var/www/html
RUN mkdir -p /run/nginx
RUN mkdir -p /run/php7

# -----------------------------------------------------> copy default conf

COPY ./wp-nginx.conf /etc/nginx/conf.d/default.conf
COPY ./supervisord.conf /etc/supervisord.conf

COPY ./wp-run.sh .
RUN chmod +x wp-run.sh

# -----------------------------------------------------> nginx - ssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:2048 -x509 -days 365 -nodes -subj "/C=RU/ST=Kazan/L=Kazan/O=21School/OU=budelphi/CN=html" -out /etc/nginx/ssl/html.pem -keyout /etc/nginx/ssl/html.key

# -----------------------------------------------------> download wp-cli

# WP-CLI is the command-line interface for WordPress
COPY ./wp-cli.phar /
# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Change default conf for mysql
# COPY ./wp-config.php /var/www/wordpress/

# -----------------------------------------------------> run wp-cli

# WP start from entry
ENTRYPOINT ["/bin/sh", "/wp-run.sh"]

EXPOSE 5050
