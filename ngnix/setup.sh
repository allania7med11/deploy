echo "Installing Nginx"
sudo apt update
sudo apt install nginx -y
echo "Adjusting the Firewall"
sudo ufw app list
sudo ufw allow 'Nginx HTTP'

