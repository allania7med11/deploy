echo "Add shop_front files"
sudo rm -fr /var/www/shop_front/*
sudo cp -a /vagrant/apps/shop_front/. /var/www/shop_front/
