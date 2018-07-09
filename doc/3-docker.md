# Docker

## Liens utiles

- https://openclassrooms.com/courses/3631731-introduction-aux-conteneurs?status=published
- https://www.grafikart.fr/tutoriels/docker

## A installer sur sa machine

- docker (https://www.docker.com/)
- docker-compose (https://docs.docker.com/compose/)
- nginx-proxy (https://github.com/jwilder/nginx-proxy)
- dnsmasq (https://doc.ubuntu-fr.org/configuration_serveur_dns_dhcp)
- ruby : pour pouvoir utiliser l'outil c42 et Capistrano

## Etapes d'initialisation du projet

### Gemfile

Créer un fichier Gemfile à la racine du projet

```
source "https://rubygems.org"

gem "net-ssh", group: :deployment
gem "capistrano", "2.15.4", group: :deployment
gem "railsless-deploy", group: :deployment
gem "nokogiri", group: :deployment
gem "c42", group: :development
```

Puis lancer la commande `sudo gem install bundler` pour installer les dépendances

### C42

- Créer le répertoire `.c42` avec les fichiers suivants :
    - tasks.rb : configuration des tâches
    - docker-compose.yml.dist
    - docker/cake/Dockerfile
    - docker/composer/Dockerfile
    - docker/php_additional.ini
    - tmp/.gitignore
- Lancer la commande `c42 install`
- Aller sur http://demo.test/

## Commandes utiles

- `docker-compose ps` : liste les conteneurs du projet en cours
- `docker ps ` : liste les conteneurs du système
- `docker-compose stop` : stope les conteneurs
- `docker-compose stop web` : stope le conteneur web
- `docker-compose rm` : supprime les conteneurs
- `docker-compose rm web` : supprime le conteneur web
- `docker-compose build` : construit les conteneurs
- `docker-compose build web` : construit le conteneur web
- `docker exec web bash` : lance un invité de commande sur le conteneur web
- `docker images` : liste les images docker téléchargés
- `docker rmi composer/composer` : supprime l'image composer/composer