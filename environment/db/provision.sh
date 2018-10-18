#! /bin/bash

sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update -y
sudo apt-get install -y mongodb-org=3.2.18 mongodb-org-server=3.2.18 mongodb-org-shell=3.2.18 mongodb-org-mongos=3.2.18 mongodb-org-tools=3.2.18

sudo rm -f /etc/mongod.conf
sudo ln -s /home/ubuntu/db/environment/db/mongod.conf /etc/mongod.conf

sudo service mongod start
sudo service mongod restart
sudo systemctl enable mongod
