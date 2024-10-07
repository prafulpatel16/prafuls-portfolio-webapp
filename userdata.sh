#!/bin/bash
sudo apt update
sudo apt install -y apache2
sudo ufw allow 'apache full'
sudo apt install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update
sudo apt install -y php7.4
sudo apt install php7.4-common php7.4-mysql php7.4-xml php7.4-xmlrpc php7.4-curl php7.4-gd php7.4-imagick php7.4-cli php7.4-dev php7.4-imap php7.4-mbstring php7.4-opcache php7.4-soap php7.4-zip php7.4-intl -y
sudo apt update
sudo apt install mysql-client-core-8.0 
sudo git clone https://github.com/prafulpatel16/php-html-projects.git
sudo cp -r php-html-projects/iPortfoliov1_emp/* /var/www/html/  









