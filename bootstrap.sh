    #!/usr/bin/env bash

    apt-get update
    apt-get install -y apache2
    apt-get install -y php7.0
    apt-get install -y libapache2-mod-php
    if ! [ -L /var/www ]; then
      rm -rf /var/www
      ln -fs /vagrant /var/www
    fi
