#!/bin/bash
sudo docker swarm init --advertise-addr=192.168.100.100
sudo docker swarm join-token worker | grep docker > /vagrant/worker.sh
sudo docker volume create app
sudo docker service create --name meu-app --replicas 15 -dt -p 80:80 --mount type=volume,src=app,dst=/usr/local/apache2/htdocs/ httpd
sudo apt-get install nfs-server -y
sudo apt-get update -y
sudo apt-get upgrade -y
sudo echo "<html><h1>meu cluster</h1></html>" >> /var/lib/docker/volumes/app/_data/index.html
sudo echo "/var/lib/docker/volumes/app/_data *(rw,sync,subtree_check)" >> /etc/exports
sudo exportfs -ar