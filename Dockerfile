# Base de l'image Distribution UBUNTU
FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=nointeractive
# MaJ de UBUNTU + install des dépendances
RUN  apt-get update && apt-get install -y \
    apache2 \
    php \
    libapache2-mod-php \
    php-zip \
    php-gd \
    php-mbstring \
    php-json \
    php-curl \
    wget \
    unzip

# Activer module REWRITE dans Apache
RUN a2enmod rewrite 

#Exposer le port 80
EXPOSE 80 

# Telecharger et installer phpmyadmin
RUN mkdir -p /usr/src/phpmyadmin \
   && cd /usr/src/phpmyadmin \
   && wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz \
   && tar xzf phpMyAdmin-latest-all-languages.tar.gz -C /usr/src/phpmyadmin --strip-components=1 \
   && rm phpMyAdmin-latest-all-languages.tar.gz \
   && ln -s /usr/src/phpmyadmin /var/www/html/phpmyadmin

COPY config.inc.php /usr/src/phpmyadmin/config.inc.php

# Créer le répertoire tmp dans phpmyadmin et lui donner les acces totals
RUN mkdir -p /usr/src/phpmyadmin/tmp/ && \
     chmod 777 /usr/src/phpmyadmin/tmp/
  
# Copier les fichiers de votre site web dans le répertoire par défaut d'Apache     
COPY esport/ /var/www/html/esport/

#Copier et rendre exécutable le script de démarrage
COPY start.sh /start.sh 
RUN chmod +x /start.sh

#Commande de démarrage
CMD ["/start.sh"]