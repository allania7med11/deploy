sudo cp -a ./ngnix/sites-available/dev.conf  /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/dev.conf /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx