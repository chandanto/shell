#!/bin/sh

yum install -y docker 
for i in docker; do for n in start status; do systemctl $n $i; done;done

docker swarm init
docker swarm join-token worker  | grep -v command > /tmp/worker.sh
chmod 740 /tmp/worker.sh

wget https://raw.githubusercontent.com/chandanto/ppk/master/chandan_public_key_pem
chmod 600 chandan_public_key_pem

scp -o StrictHostKeyChecking=no -i  'chandan_public_key_pem' /tmp/worker.sh root@vm-2:/tmp
scp -o StrictHostKeyChecking=no -i  'chandan_public_key_pem' /tmp/worker.sh root@vm-3:/tmp
