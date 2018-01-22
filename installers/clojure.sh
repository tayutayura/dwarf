#!/bin/bash

wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein

sudo mv lein /usr/local/bin
sudo chmod a+x /usr/local/bin/lein

lein --version
