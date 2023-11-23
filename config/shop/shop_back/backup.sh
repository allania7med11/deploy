# remote
echo "Backup shop_db at $(date +"%Y_%m_%d_%I_%M_%p")"
sudo -u postgres pg_dump shop_db > $(pwd)/config/shop_back/shop_db/backups/shop_db_$(date +"%Y_%m_%d_%I_%M_%p").sql
# local
scp username@remote:/path/to/shop_db_$(date +"%Y_%m_%d_%I_%M_%p").sql /path/to/local/folder
