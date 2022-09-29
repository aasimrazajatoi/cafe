!#/bin/bash

#copy code from workspace to nginx server
scp -r -i new.pem * ubuntu@50.18.76.214:/home/ubuntu/cafe

#copy code to /var/www/
ssh -i new.pem ubuntu@50.18.76.214 "sudo cp -r /home/ubuntu/cafe /var/www/"

#copy virtual host file
ssh -i new.pem ubuntu@50.18.76.214 "sudo cp -r /home/ubuntu/cafe/conf/cafe /etc/nginx/sites-available/"

#remove code
ssh -i new.pem ubuntu@50.18.76.214 "rm -rf /home/ubuntu/cafe"

#make symbolic link
ssh -i new.pem ubuntu "sudo ln -s /etc/nginx/sites-available/cafe /etc/nginx/sites-enabled/cafe"


#reload nginx
ssh -i new.pem ubuntu@50.18.76.214 "sudo systemctl reload nginx"








