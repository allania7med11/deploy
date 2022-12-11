sudo apt install certbot python3-certbot-nginx -y
sudo certbot --nginx -d testingapp.live -d www.testingapp.live
sudo systemctl status certbot.timer
sudo certbot renew --dry-run