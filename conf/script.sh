#!/bin/bash

echo "copy the code from workspace to nginx server..."
scp -r  ../cafe SERVER_NAME:/home/ubuntu/cafe

echo "copy code to /var/www/"
ssh SERVER_NAME "sudo cp -r /home/ubuntu/cafe /var/www/"

echo "copying the file called virtual host..."
ssh SERVER_NAME "sudo cp -r /home/ubuntu/cafe/conf/cafe /etc/nginx/sites-available/"

echo "remove code..."
ssh SERVER_NAME "rm -rf /home/ubuntu/cafe"

echo "make symbolic link..."
ssh SERVER_NAME "sudo ln -s /etc/nginx/sites-available/cafe /etc/nginx/sites-enabled/cafe"


echo "reload nginx..."
ssh SERVER_NAME "sudo systemctl reload nginx"








