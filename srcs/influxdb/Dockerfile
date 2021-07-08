# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: budelphi <budelphi@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/17 12:06:16 by budelphi          #+#    #+#              #
#    Updated: 2021/04/25 10:57:43 by budelphi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# -----------------------------------------------------> alpine
# Use alpine 3.12 
FROM alpine:3.12

# Add packages
RUN apk update
RUN apk add supervisor influxdb

# -----------------------------------------------------> Telegraf

RUN apk add telegraf --no-cache --repository http://dl-2.alpinelinux.org/alpine/edge/community
RUN mkdir /etc/telegraf/

# -----------------------------------------------------> InfluxDB

# Запустите telegraf, включив плагины ввода cpu & memory и вывода infxdb
RUN ./usr/bin/telegraf -sample-config --input-filter docker --output-filter influxdb > /etc/telegraf/telegraf.conf

# -----------------------------------------------------> Default conf

COPY ./supervisord.conf /etc/supervisord.conf
# COPY start-influxdb.sh /
# RUN chmod -R 755 /start-influxdb.sh

# -----------------------------------------------------> run InfluxDB

# CMD ["sh", "start-influxdb.sh"]
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

EXPOSE 8086