echo "****Create shop_db and load data****"
source /vagrant/config/shop_back/.env
sudo -u postgres dropdb shop_db with force
sudo -u postgres createdb shop_db
sudo -u postgres psql shop_db < /home/ah/Documents/Portfolio/deploy/config/shop_back/shop_db/shop_db_init.sql
echo "****Clone build and run shop_back image****"
cd ./apps
git clone https://github.com/allania7med11/shop_back.git
