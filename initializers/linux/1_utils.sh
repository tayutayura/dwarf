#!/bin/bash

sudo yum -y update

# Install utility tools
sudo yum install -y wget\
                    unzip\
                    yum-utils\
                    ctags
