#!/bin/sh

yum -y install gcc openssl-devel bzip2-devel
cd /usr/src
wget https://www.python.org/ftp/python/3.6.8/Python-3.6.8.tgz
tar xzf Python-3.6.8.tgz
cd Python-3.6.8
./configure --enable-optimizations
make altinstall


rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[azure-cli]\nname=Azure CLI\nbaseurl=https://packages.microsoft.com/yumrepos/azure-cli\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/azure-cli.repo'
yum -y install azure-cli
