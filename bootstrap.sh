    #!/usr/bin/env bash

    sudo apt-get update
    sudo apt-get install -y apache2
    sudo apt-get install -y php7.0
    sudo apt-get install -y libapache2-mod-php
    if ! [ -L /var/www ]; then
      sudo rm -rf /var/www
      sudo ln -fs /vagrant /var/www
    fi
sudo mkdir /vagrant/virtualhosts
sudo mkdir /vagrant/virtualhosts/default
sudo echo "<VirtualHost *:80>
  DocumentRoot /var/www/html/web
</VirtualHost>" > /vagrant/virtualhosts/default/000-default.conf
sudo rm /etc/apache2/sites-enabled/000-default.conf
sudo ln -s /vagrant/virtualhosts/default/000-default.conf /etc/apache2/sites-enabled/000-default.conf
sudo mkdir /var/www/html
sudo mkdir /var/www/html/web
sudo touch /var/www/html/web/index.php
sudo echo "<?php
phpinfo();
?>" > /var/www/html/web/index.php
sudo service apache2 reload
