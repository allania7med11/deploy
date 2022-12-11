echo "Installing PostgreSQL"
sudo apt update
sudo apt install postgresql postgresql-contrib -y
sudo systemctl start postgresql.service
source /vagrant/config/db/.env
sudo -u postgres psql -U postgres -d postgres -c "alter user postgres with password '$POSTGRES_PASSWORD';"