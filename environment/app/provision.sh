#!/bin/bash

# Update the sources list
sudo apt-get update -y

# upgrade any packages available
sudo apt-get upgrade -y

sudo apt-get upgrade -y

# install nginx
sudo apt-get install nginx -y

# configuring nginx proxy
sudo unlink /etc/nginx/sites-enabled/default
cd /etc/nginx/sites-available
sudo touch reverse-proxy.conf
sudo chmod 666 reverse-proxy.conf
echo "server{
  listen 80;
  server_name development.local;
  location / {
      proxy_pass http://127.0.0.1:3000;
  }
}" >> reverse-proxy.conf
sudo ln -s /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy.conf
sudo service nginx restart


# installing node and npm

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install nodejs -y
sudo apt-get install npm -y


# App set up, setting it to my DB ip and to the mongo db port

# Because our DB is running on a different VM, we would connect to the IP of where the DB is placed
# we must also make sure the firewall allows inbound connection from the ap vm, to be able to interact and grab the data

# Here we are pasting an env variable into the bashrc file of the VM, so it says persistent
echo export DB_HOST="mongodb://124.11.2.59/posts" >> ~/.bashrc

# If the DB is running on same machine as the app, the IP of the DB would be the local host
# export DB_HOST="mongodb://127.0.0.1:27017/posts"

# We need to go into our app folder before we run sudo npm install, this is because this is where our package.json file is found
# this allows npm to install the dependencies
cd /home/ubuntu/app

#Looks for the package.json file and uses that to install all the dependencies necessary
# the node equivalent of pip install requirements.txt
sudo npm install

# Install pm2
sudo npm install pm2 -g






# Pm2 manages the application
# pm2 stop app.js
  pm2 stop all # works anywhere and not just in the folder
  pm2 start app.js -f
