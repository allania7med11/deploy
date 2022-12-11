echo "Create shop_db and load data"
source /vagrant/config/shop_back/.env
sudo -u postgres dropdb shop_db
sudo -u postgres createdb shop_db
sudo -u postgres psql shop_db < /vagrant/apps/shop_back/shop_db.sql
echo "Load and run shop_back image"
sudo docker load < /vagrant/apps/shop_back/shop_back.tar
sudo kill -9 $(sudo lsof -t -i:8000)
sudo docker run -d --network=host --env-file /vagrant/config/shop_back/.env shop_back:v1 8000
echo "Add shop_back static files"
sudo rm -fr /var/www/shop_back_static/*
sudo cp -a /vagrant/apps/shop_back/static/. /var/www/shop_back_static/