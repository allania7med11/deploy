source "./init/.env"
chmod 755 /home/$USERNAME
sudo -u postgres psql -f ./config/shop/shop_back/shop_db/load.sql