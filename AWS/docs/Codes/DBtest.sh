#!/bin/bash
echo "Y" | sudo apt-get update
echo "" | sudo add-apt-repository ppa:ondrej/php
echo "Y" | sudo apt update
echo "Y" | sudo apt install php7.2-mysql
sudo wget https://raw.githubusercontent.com/AbdallahCoptan/HandsOn/master/AWS/docs/Codes/mysql.txt
cat mysql.txt | sudo apt install mysql-server
echo "Y" | sudo apt install php7.2
sudo /etc/init.d/apache2 restart
sudo groupadd www
sudo usermod -a -G www ubuntu
sudo chown -R ubuntu:www /var/www
sudo chgrp -R www /var/www
sudo chmod 2775 /var/www
find /var/www -type d -exec chmod 2775 {} \;
find /var/www -type f -exec chmod 0664 {} \;
cd /var/www
sudo mkdir inc
cd inc
sudo wget https://raw.githubusercontent.com/AbdallahCoptan/HandsOn/master/AWS/docs/Codes/dbinfo.inc
cd
cd /var/www/html
sudo wget https://raw.githubusercontent.com/AbdallahCoptan/HandsOn/master/AWS/docs/Codes/DB.php
