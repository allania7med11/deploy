echo "Backup structure_db at $(date +"%Y_%m_%d_%I_%M_%p")"
sudo -u postgres pg_dump shop_db > $(pwd)/apps/structure/backups/structure_db_$(date +"%Y_%m_%d_%I_%M_%p").sql

sudo -u postgres pg_dump shop_db > $(pwd)/notes/structure_db_init.sql