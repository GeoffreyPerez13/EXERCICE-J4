# Création des réseaux 

docker network create esport_network

# creation conteneur Mysql 

docker run --name mysqldb -e MYSQL_ROOT_PASSWORD=abcdefghijkl123456789 -d --network esport_network mysql

# modification des fichiers : 

Dockerfile + config.inc.php ! IMPORTANT

#  Création de la nouvelle image

docker build -t esport:network .

# Création du conteneur 

docker run --name esportapp -d -p 3000:80 --network esport_network esport:network

tester : 

http://localhost:3000/esport
http://localhost:3000/phpmyadmin ( user : root, password: abcdefghijkl123456789)