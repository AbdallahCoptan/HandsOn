#!/bin/bash
echo "Y" | sudo apt-get update
echo "" | sudo add-apt-repository ppa:ondrej/php
echo "Y" | sudo apt update
echo "Y" | sudo apt install php7.2
sudo groupadd apache
sudo usermod -a -G apache ubuntu
sudo chown -R ubuntu:apache /var/www
sudo chmod 2775 /var/www
find /var/www -type d -exec chmod 2775 {} \;
find /var/www -type f -exec chmod 0664 {} \;
echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
cd /var/www/html/
wget https://raw.githubusercontent.com/AbdallahCoptan/HandsOn/master/AWS/docs/Codes/hydro.html

