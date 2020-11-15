#!/bin/bash
echo "Y" | sudo apt-get update
sudo apt install stress
echo "" | sudo add-apt-repository ppa:ondrej/php
echo "Y" | sudo apt update
echo "Y" | sudo apt install php7.2
sudo groupadd apache
sudo usermod -a -G apache ubuntu
sudo chown -R ubuntu:apache /var/www
sudo chmod 2775 /var/www
find /var/www -type d -exec chmod 2775 {} \;
find /var/www -type f -exec chmod 0664 {} \;
cd /var/www/html/
wget 

