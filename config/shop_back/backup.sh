echo "Backup shop_db at $(date +"%Y_%m_%d_%I_%M_%p")"
sudo -u postgres pg_dump shop_db > $(pwd)/apps/shop_back/backups/shop_db_$(date +"%Y_%m_%d_%I_%M_%p").sql