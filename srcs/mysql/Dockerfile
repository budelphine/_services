# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: budelphi <budelphi@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/11 13:02:18 by budelphi          #+#    #+#              #
#    Updated: 2021/04/17 10:38:08 by budelphi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# -----------------------------------------------------> alpine
# Use alpine 3.12 
FROM alpine:3.12

# Add packages
RUN apk update
RUN apk add mariadb mariadb-client openrc

# Copy default conf
COPY ./my.cnf /etc/
COPY ./mysql-run.sh .
RUN chmod +x mysql-run.sh

# -----------------------------------------------------> MySQL

# Debug alpine
RUN mkdir /run/mysqld
RUN chown -R mysql /run/mysqld

# -----------------------------------------------------> run MySQL

CMD ["/bin/sh", "mysql-run.sh"]

EXPOSE 3306
