# Création de l'image 

docker build -t lamp .  


# Monter conteneur : 

Sans bind de répertoire : 

docker run -d --rm -p 80:80  lamp
=> Application accessible dans : localhost/esport
PAS DE MODIFICATIOND DU CODE SOURCE REALISABLE DEPUIS LA MACHINE HOTE. ( MAIS OK DANS LE CONTENEUR ! )

Avec Bind d'un répertoire contenant le source pour travailler sur le projet ESPORT : 
docker run -d --rm -p 81:80 -v $PWD/esport:/var/www/html/esport  lamp
=> Application accessible dans : localhost:81/esport


=> Le contenu HTML du dossier de limage /esport va etre écrasé par le contenu du dossier : $PWD/esport
Si le conteneur est le meme : on peut alors travailler depuis la machine hôte sur le projet Esport

Avec Bind d'un nouveau dossier de la machine vers un nouveau nouveau du conteneur ( ex : une version2) 
docker run -d --rm -p 83:80 -v $PWD/esportv2:/var/www/html/esportv2  lamp
=> Application accessible dans : localhost:83/esportv2  et localhost:83/esport sera toujours disponible