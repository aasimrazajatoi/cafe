#!/bin/bash


cp -i conf/cafe /etc/sites-available/
ln -s /etc/nginx/sites-available/cafe /etc/nginx/sites-enabled/cafe

systemctl reload nginx






