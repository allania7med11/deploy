echo "****Install PostgreSQL****"
sudo apt update
sudo apt install postgresql postgresql-contrib -y
sudo systemctl start postgresql.service
echo $POSTGRES_PASSWORD
sudo -u postgres psql -U postgres -d postgres -c "alter user postgres with password '$POSTGRES_PASSWORD';"
echo "****Display PostgreSQL version****"
psql -V