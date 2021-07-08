#!/bin/bash 

ROSE_COLOR="\033[1m\033[35m"
UNSET_CLR="\033[0m"

# -----------------------------------------------------> Minikube stop
clear
echo -e $ROSE_COLOR"MINIKUBE - DELETE"$UNSET_CLR
minikube stop
minikube delete

# -----------------------------------------------------> Minikube start

echo -e $ROSE_COLOR"MINIKUBE - START"$UNSET_CLR
minikube start --vm-driver=virtualbox
# minikube start --vm-driver=virtualbox --cpus=4 --memory=4400MB --disk-size=40000MB
# minikube start --vm-driver=virtualbox --memory=4400MB --disk-size=40000MB

# -----------------------------------------------------> Minikube eval && Docker fix

echo -e $ROSE_COLOR"MINIKUBE - EVAL ENV"$UNSET_CLR
eval $(minikube docker-env)
# docker pull metallb/speaker:v0.8.2
# docker pull metallb/controller:v0.8.2

# -----------------------------------------------------> LoadBalancer

echo -e $ROSE_COLOR"LOADBALANCER - METALLB"$UNSET_CLR
minikube addons enable metallb
kubectl apply -f srcs/yaml/configmap.yaml

# -----------------------------------------------------> Nginx

echo -e $ROSE_COLOR"SERVICE - NGINX"$UNSET_CLR
docker build -t nginx-image srcs/nginx

# -----------------------------------------------------> Mysql

echo -e $ROSE_COLOR"SERVICE - MYSQL"$UNSET_CLR
docker build -t mysql-image srcs/mysql

# -----------------------------------------------------> Wordpress

echo -e $ROSE_COLOR"SERVICE - WPCLI"$UNSET_CLR
docker build -t wordpress-image srcs/wordpress

# -----------------------------------------------------> PhpMyAdmin

echo -e $ROSE_COLOR"SERVICE - PMA"$UNSET_CLR
docker build -t phpmyadmin-image srcs/phpmyadmin

# -----------------------------------------------------> Ftps

echo -e $ROSE_COLOR"SERVICE - FTP"$UNSET_CLR
docker build -t ftps-image srcs/ftps

# -----------------------------------------------------> Grafana

echo -e $ROSE_COLOR"SERVICE - GRAFANA"$UNSET_CLR
docker build -t grafana-image srcs/grafana

# -----------------------------------------------------> Grafana

echo -e $ROSE_COLOR"SERVICE - INFLUXDB"$UNSET_CLR
docker build -t influxdb-image srcs/influxdb

# -----------------------------------------------------> Apply

echo -e $ROSE_COLOR"APPLY - YAML"$UNSET_CLR
kubectl apply -f srcs/yaml/nginx.yaml
kubectl apply -f srcs/yaml/mysql.yaml
kubectl apply -f srcs/yaml/wordpress.yaml
kubectl apply -f srcs/yaml/phpmyadmin.yaml
kubectl apply -f srcs/yaml/ftps.yaml
kubectl apply -f srcs/yaml/grafana.yaml
kubectl apply -f srcs/yaml/influxdb.yaml

# -----------------------------------------------------> Get pod, svc, dashboard

echo -e $ROSE_COLOR"GET - POD"$UNSET_CLR
sleep 4
kubectl get pod

echo -e $ROSE_COLOR"GET - SVC"$UNSET_CLR
kubectl get svc

echo -e $ROSE_COLOR"GET - DASHBOARD"$UNSET_CLR
sleep 4
minikube dashboard

# kubectl delete  -f wp.yaml
# docker container run <image name>
# kubectl cp grafana-deployment-7c577bbd69-vfsr5:"grafana/data/grafana.db" ~/ecole21/04_ft_services/test/srcs/grafana/grafana.db
