sudo snap install core; sudo snap refresh core
sudo apt remove certbot -y
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot
sudo nginx -t
sudo certbot --nginx -d testingapp.live -d www.testingapp.live
sudo systemctl status snap.certbot.renew.service
sudo certbot renew --dry-run