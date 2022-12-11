echo "Add ngnix files"
sudo rm -fr /etc/nginx/sites-available/*
sudo cp -a /vagrant/ngnix/sites-available/.  /etc/nginx/sites-available/
sudo cp /vagrant/ngnix/nginx.conf /etc/nginx/
echo "Create sites-available links"
sudo rm -fr /etc/nginx/sites-enabled/*
sudo ln -s /etc/nginx/sites-available/shop /etc/nginx/sites-enabled/
echo "Restart nginx"
sudo nginx -t
sudo systemctl restart nginx