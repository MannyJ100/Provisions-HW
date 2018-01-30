#!/bin/bash

# update and upgrade
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install nginx -y

# install mongodb
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update

sudo apt-get install -y mongodb-org=3.2.18 mongodb-org-server=3.2.18 mongodb-org-shell=3.2.18 mongodb-org-mongos=3.2.18 mongodb-org-tools=3.2.18
sudo systemctl start mongod
sudo systemctl enable mongod
# Removing file from guest
sudo rm /etc/mongod.conf
# Copying file from host to guest
sudo cp /home/ubuntu/db/mongod.conf /etc/mongod.conf
sudo service mongod restart