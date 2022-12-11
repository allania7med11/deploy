echo "Installing Nginx"
sudo apt update
sudo apt install nginx -y
echo "Adjusting the Firewall"
sudo ufw app list
sudo ufw allow 'Nginx HTTP'
echo "Add static files"
sudo rm -fr /var/www/testingapp.live/*
sudo cp -a /vagrant/apps/staticapp/. /var/www/testingapp.live/
echo "Add ngnix files"
sudo rm -fr /etc/nginx/sites-available/*
sudo cp -a /vagrant/ngnix/sites-available/.  /etc/nginx/sites-available/
sudo cp /vagrant/ngnix/nginx.conf /etc/nginx/
echo "Create sites-available links"
sudo rm -fr /etc/nginx/sites-enabled/*
sudo ln -s /etc/nginx/sites-available/testingapp.live /etc/nginx/sites-enabled/
echo "Restart nginx"
sudo nginx -t
sudo systemctl restart nginx
