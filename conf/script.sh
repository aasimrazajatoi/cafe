#!/bin/bash

echo "copy code from workspace to nginx server..."
scp -r -i ../new.pem * ubuntu@50.18.76.214:/home/ubuntu/cafe

echo "copy code to /var/www/"
ssh -i ../new.pem ubuntu@50.18.76.214 "sudo cp -r /home/ubuntu/cafe /var/www/"

echo "copy virtual host file..."
ssh -i ../new.pem ubuntu@50.18.76.214 "sudo cp -r /home/ubuntu/cafe/conf/cafe /etc/nginx/sites-available/"

echo "remove code..."
ssh -i ../new.pem ubuntu@50.18.76.214 "rm -rf /home/ubuntu/cafe"

echo "make symbolic link..."
ssh -i ../new.pem ubuntu "sudo ln -s /etc/nginx/sites-available/cafe /etc/nginx/sites-enabled/cafe"


echo "reload nginx..."
ssh -i ../new.pem ubuntu@50.18.76.214 "sudo systemctl reload nginx"








