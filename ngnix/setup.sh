echo "Installing Nginx"
sudo apt update
sudo apt install nginx -y
echo "Adjusting the Firewall"
sudo ufw allow 'Nginx Full'
sudo ufw delete allow 'Nginx HTTP'
sudo ufw enable
sudo ufw status
