#!/bin/bash

sudo yum -y install yum-utils

sudo rpm -Uvh https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm

sudo yum-config-manager --disable mysql57-community
sudo yum-config-manager --enable mysql56-community

sudo yum install mysql-community-server

sudo systemctl start mysqld.service
sudo systemctl enable mysqld.service

# sudo service mysqld start
# sudo chkconfig mysqld on
