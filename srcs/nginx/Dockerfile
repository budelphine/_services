# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: budelphi <budelphi@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/17 18:53:10 by budelphi          #+#    #+#              #
#    Updated: 2021/04/14 10:01:03 by budelphi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# -----------------------------------------------------> alpine
# Use alpine 3.12 
FROM alpine:3.12

# Add packages
RUN apk update && apk upgrade
RUN apk add nginx openssl openrc

# -----------------------------------------------------> nginx
# Copy sources
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

# Debug Alpine
RUN mkdir -p /run/nginx

# Generate SSL sertification  
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:2048 -x509 -days 365 -nodes -subj "/C=RU/ST=Kazan/L=Kazan/O=21School/OU=budelphi/CN=html" -out /etc/nginx/ssl/html.pem -keyout /etc/nginx/ssl/html.key

# -----------------------------------------------------> run
# Start
CMD ["nginx", "-g", "daemon off;"]

# Expose port
EXPOSE 22 80 443
