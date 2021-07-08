# _services
*System Administration and Networking project with Docker and Kubernetes*

**Task**
- Build using Alpine Linux
- The Load Balancer (Metallb)
- Wordpress:5050
- PhpMyAdmin:5000
- Nginx:80 & nginx:443
- FTPS server listening on port 21
- Grafana:3000
- And MySql, InfluxDB, Telegraf

It is forbidden to take already build images or use services like DockerHub. 
Use nodeport also forbidden.

**How to use**  
```./setup.sh``` - to up Cluster

**Result**
- [x] - Kubernetes cluster raised with minikube
- [x] - Each service in its own container
- [x] - Storing databases in Kubernetes
