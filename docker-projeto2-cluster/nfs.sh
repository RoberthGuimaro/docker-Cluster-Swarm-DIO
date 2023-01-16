#!/bin/bash
sudo docker volume create app
sudo apt install nfs-common -y
sudo apt-get update -y
sudo apt-get upgrade -y
showmount -e [192.168.100.100]
sudo mount 192.168.100.100:var/lib/docker/volumes/app/_data /var/lib/docker/volumes/app/_data