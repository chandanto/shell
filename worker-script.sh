#!/bin/sh

yum install -y docker 
for i in docker; do for n in start status; do systemctl $n $i; done;done

sleep 20

chmod 740 /tmp/worker.sh
/tmp/worker.sh

cd /opt; wget https://github.com/chandanto/forward-files/raw/master/updated-code_docker_compose.tar
tar -xvf updated-code_docker_compose.tar
rm -rf /opt/updated-code_docker_compose.tar ; rm -rf /opt/docker-compose.yml; rm -rf /tmp/worker.sh
