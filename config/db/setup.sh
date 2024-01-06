echo "****Install PostgreSQL****"
sudo apt update
sudo apt install postgresql postgresql-contrib -y
SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"
echo "****Load variables from $SCRIPT_DIR/.env****"
source "$SCRIPT_DIR/.env"
sudo systemctl start postgresql.servic
echo $POSTGRES_PASSWORD
sudo -u postgres psql -U postgres -d postgres -c "alter user postgres with password '$POSTGRES_PASSWORD';"
echo "****Display PostgreSQL version****"
psql -V