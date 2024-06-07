#!/bin/bash

# Update de pakkettenlijst
sudo apt-get update

# Installeer pakketten om repository's over HTTPS te kunnen gebruiken
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Voeg de Docker GPG-sleutel toe
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Voeg de Docker repository toe aan de apt bronnen
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update de pakkettenlijst opnieuw nu met Docker repository
sudo apt-get update

# Installeer Docker
sudo apt-get install -y docker-ce

# Voeg de huidige gebruiker toe aan de docker-groep om Docker te kunnen gebruiken zonder sudo
sudo usermod -aG docker $USER

# Herlaad de groepen voor de huidige gebruiker
newgrp docker

# Toon de draaiende Docker-containers
sudo docker ps
