# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: budelphi <budelphi@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/17 10:31:32 by budelphi          #+#    #+#              #
#    Updated: 2021/05/04 21:38:10 by budelphi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

RUN apk update
RUN apk add vsftpd openssl
RUN echo "root:root" | chpasswd
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=RU/ST=Kazan/L=Kazan/O=21School/CN=html" -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt

COPY /vsftpd.conf /etc/vsftpd
COPY /start.sh /

CMD ["sh", "start.sh"]

EXPOSE 20 21 30020 30021
