#!/bin/bash

echo "copy the code from workspace to nginx server..."
scp -r  ../cafe ubuntu@51.19.75.215:/home/ubuntu/cafe

echo "copy code to /var/www/"
ssh ubuntu@51.19.75.215 "sudo cp -r /home/ubuntu/cafe /var/www/"

echo "copy virtual host file..."
ssh ubuntu@51.19.75.215 "sudo cp -r /home/ubuntu/cafe/conf/cafe /etc/nginx/sites-available/"

echo "remove code..."
ssh ubuntu@51.19.75.215 "rm -rf /home/ubuntu/cafe"

echo "make symbolic link..."
ssh ubuntu@51.19.75.215 "sudo ln -s /etc/nginx/sites-available/cafe /etc/nginx/sites-enabled/cafe"


echo "reload nginx..."
ssh ubuntu@51.19.75.215 "sudo systemctl reload nginx"








