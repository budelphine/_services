# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: budelphi <budelphi@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/17 10:36:23 by budelphi          #+#    #+#              #
#    Updated: 2021/04/24 12:07:30 by budelphi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# -----------------------------------------------------> alpine
# Use alpine 3.12 
FROM alpine:3.12

# Add packages
RUN apk update
RUN apk add libc6-compat

# -----------------------------------------------------> Grafana

RUN wget https://dl.grafana.com/oss/release/grafana-7.3.6.linux-amd64.tar.gz
RUN tar -zxvf grafana-7.3.6.linux-amd64.tar.gz
RUN rm grafana-7.3.6.linux-amd64.tar.gz
RUN mv grafana-7.3.6 grafana

# -----------------------------------------------------> Default conf

# # Copy default conf
COPY grafana.db /grafana/data/grafana.db
COPY start-grafana.sh /
RUN chmod -R 755 /start-grafana.sh

# -----------------------------------------------------> run Grafana

CMD ["/start-grafana.sh"]

EXPOSE 3000



