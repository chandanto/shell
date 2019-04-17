#!/bin/sh

docker pull docker.io/dockersamples/visualizer:latest
docker pull docker.io/231116/myapp:v1
docker pull docker.io/231116/jbossews_webserver_1.0:latest


#### Start Visualization container #####
docker service create   --name=viz   -p 8000:8080   --constraint=node.role==manager   --mount=type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock   dockersamples/visualizer

#### Start application ######
docker service create --name application -p 8081:8080 -p 8082:8443 --replicas 3 --constraint 'node.role == worker' docker.io/231116/myapp:v1


cd /opt
docker stack deploy --compose-file docker-compose.yml portal

