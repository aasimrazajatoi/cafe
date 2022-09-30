#!/bin/bash

echo "copy code from workspace to nginx server..."
scp -r  ../cafe ubuntu@50.18.76.214:/home/ubuntu/cafe

echo "copy code to /var/www/"
ssh ubuntu@50.18.76.214 "sudo cp -r /home/ubuntu/cafe /var/www/"

echo "copy virtual host file..."
ssh ubuntu@50.18.76.214 "sudo cp -r /home/ubuntu/cafe/conf/cafe /etc/nginx/sites-available/"

echo "remove code..."
ssh ubuntu@50.18.76.214 "rm -rf /home/ubuntu/cafe"

echo "make symbolic link..."
ssh ubuntu@50.18.76.214 "sudo ln -s /etc/nginx/sites-available/cafe /etc/nginx/sites-enabled/cafe"


echo "reload nginx..."
ssh ubuntu@50.18.76.214 "sudo systemctl reload nginx"








