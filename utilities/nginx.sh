#!/bin/bash

sudo rpm -ivh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
sudo yum -y install nginx

sudo systemctl start nginx.service
sudo systemctl enable nginx.service

# sudo /etc/rc.d/init.d/nginx start
# sudo chkconfig nginx on
