#!/bin/sh

yum install -y docker 
for i in docker; do for n in start status; do systemctl $n $i; done;done

docker swarm init
docker swarm join-token worker  | grep -v command > /tmp/worker.sh
chmod 740 /tmp/worker.sh

cd /tmp; wget https://raw.githubusercontent.com/chandanto/ppk/master/chandan_public_key_pem; chmod 600 chandan_public_key_pem

scp -o StrictHostKeyChecking=no -i  'chandan_public_key_pem' /tmp/worker.sh chandan@10.100.10.5:/tmp
scp -o StrictHostKeyChecking=no -i  'chandan_public_key_pem' /tmp/worker.sh chandan@10.100.10.6:/tmp

rm -rf /tmp/chandan_public_key_pem; rm -rf /tmp/worker.sh

cd /opt; wget https://github.com/chandanto/forward-files/raw/master/updated-code_docker_compose.tar
tar -xvf updated-code_docker_compose.tar
rm -rf updated-code_docker_compose.tar


