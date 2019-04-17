#!/bin/sh

yum install -y docker 
for i in docker; do for n in start status; do systemctl $n $i; done;done

sleep 20

chmod 740 /tmp/worker.sh
/tmp/worker.sh
