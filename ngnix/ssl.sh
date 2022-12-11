source /vagrant/.env
echo "Installing Certbot"
sudo snap install core; sudo snap refresh core
sudo apt remove certbot
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot
echo "Allowing HTTPS Through the Firewall"
sudo ufw enable
sudo ufw allow 'Nginx Full'
sudo ufw delete allow 'Nginx HTTP'
sudo ufw status
echo "Obtaining an SSL Certificate"
sudo certbot --nginx -d ${DOMAIN} -d www.${DOMAIN}
echo "Verifying Certbot Auto-Renewal"
sudo systemctl status snap.certbot.renew.service
sudo certbot renew --dry-run